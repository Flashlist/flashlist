import 'package:serverpod/serverpod.dart';

import 'package:flashlist_server/src/generated/protocol.dart';

/// Helper Class For [FlashlistItem]s
class FlashlistItemHelper {
  /// Creates a new flashlist item from the given [flashlistItem] object.
  /// Returns the created flashlist item if successful.
  Future<FlashlistItem> createFlashlistItem(
    Session session,
    FlashlistItem flashlistItem,
  ) async {
    try {
      final flashlist = await Flashlist.db.findFirstRow(
        session,
        where: (list) => list.id.equals(flashlistItem.parentId),
      );

      if (flashlist == null) {
        throw Exception('Flashlist not found');
      }

      return await FlashlistItem.db.insertRow(session, flashlistItem);
    } catch (e) {
      throw Exception('Failed to create flashlist item: $e');
    }
  }

  /// Deletes the flashlist item with the given [flashlistItemId].
  /// Returns true if successful.
  Future<bool> deleteFlashlistItem(
    Session session,
    DeleteFlashlistItem deleteItemObject,
  ) async {
    try {
      final flashlistItemToDelete = await FlashlistItem.db.findFirstRow(
        session,
        where: (item) => item.id.equals(deleteItemObject.id),
      );

      if (flashlistItemToDelete == null) {
        throw Exception('Flashlist item does not exist');
      }

      await FlashlistItem.db.deleteRow(
        session,
        flashlistItemToDelete,
      );

      await updateOrderNumbers(
        session,
        flashlistItemToDelete,
        null,
      );

      return true;
    } catch (e) {
      throw Exception('Failed to delete flashlist item: $e');
    }
  }

  /// Returns all items where [parentId] == [flashlistId].
  /// Also sorts them
  Future<List<FlashlistItem?>> getFlashlistItemsByFlashlistId(
    Session session,
    int flashlistId,
  ) async {
    final items = await FlashlistItem.db.find(
      session,
      where: (currentItem) => currentItem.parentId.equals(flashlistId),
    );

    if (items.isNotEmpty) {
      items.sort((a, b) => a.orderNr.compareTo(b.orderNr));
    }
    return items;
  }

  /// Updates the orderNr for all siblings of the given [flashlistItem].
  /// If [newOrderNr] is null, the item is being deleted and the orderNr for all
  /// siblings coming after the item should be reduced by 1.
  /// If [newOrderNr] is not null, the item is being moved and the orderNr for all
  /// siblings coming after the item should be increased or decreased accordingly.
  Future<void> updateOrderNumbers(
    Session session,
    FlashlistItem flashlistItem,
    int? newOrderNr,
  ) async {
    final flashlistItems = await FlashlistItem.db.find(session,
        where: (currentItem) =>
            currentItem.parentId.equals(flashlistItem.parentId));

    if (newOrderNr == null) {
      // Item is being deleted, reduce orderNr for all siblings coming after
      for (var currentItem in flashlistItems) {
        if (currentItem.orderNr >= flashlistItem.orderNr &&
            currentItem.id != flashlistItem.id) {
          await FlashlistItem.db.updateRow(
            session,
            currentItem.copyWith(orderNr: currentItem.orderNr - 1),
          );
        }
      }
    } else {
      // Item is being moved
      int oldOrderNr = flashlistItem.orderNr;
      for (var currentItem in flashlistItems) {
        if (currentItem.id != flashlistItem.id) {
          if (oldOrderNr < newOrderNr &&
              currentItem.orderNr > oldOrderNr &&
              currentItem.orderNr <= newOrderNr) {
            // Item is moving down the list, decrease the orderNr of every following item by 1
            await FlashlistItem.db.updateRow(
              session,
              currentItem.copyWith(orderNr: currentItem.orderNr - 1),
            );
          } else if (oldOrderNr > newOrderNr &&
              currentItem.orderNr < oldOrderNr &&
              currentItem.orderNr >= newOrderNr) {
            // Item is moving up the list, increase the orderNr of every preceding item by 1
            await FlashlistItem.db.updateRow(
              session,
              currentItem.copyWith(orderNr: currentItem.orderNr + 1),
            );
          }
        }
      }
      // Finally, update the orderNr of the moved item
      await FlashlistItem.db.updateRow(
        session,
        flashlistItem.copyWith(orderNr: newOrderNr),
      );
    }
  }
}
