import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Helper Class For [FlashlistItem]s
class FlashlistItemHelper {
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
