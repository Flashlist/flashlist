import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Function returning a List object from [streamItems] corresponding
/// with the passed flashlistId
Flashlist? getFlashlistByFromStream(
  List<Flashlist?> streamItems,
  int flashlistId,
) {
  return streamItems.firstWhere((streamItem) => streamItem!.id == flashlistId);
}

/// Function returning the index of a Flashlist within [streamItems]
int? getFlashlistIndex(
  List<Flashlist?> streamItems,
  int flashlistId,
) {
  return streamItems.indexWhere((streamItem) => streamItem!.id == flashlistId);
}

/// Function to update the orderNr of siblings of a [FlashlistItem]
/// within a [List] of [FlashlistItem]s.
void updateOrderNrForSiblings(
  List<FlashlistItem?> listItems,
  FlashlistItem item,
  int? newOrderNr,
) {
  if (newOrderNr == null) {
    // Item is being deleted, reduce orderNr for all siblings coming after
    for (var currentItem in listItems) {
      if (currentItem!.orderNr > item.orderNr) {
        currentItem.orderNr = currentItem.orderNr - 1;
      }
    }
  } else {
    // Item is being moved
    int oldOrderNr = item.orderNr;
    for (var currentItem in listItems) {
      if (currentItem!.id != item.id) {
        if (oldOrderNr < newOrderNr &&
            currentItem.orderNr > oldOrderNr &&
            currentItem.orderNr <= newOrderNr) {
          // Item is moving down the list, decrease the orderNr of every following item by 1
          currentItem.orderNr = currentItem.orderNr - 1;
        } else if (oldOrderNr > newOrderNr &&
            currentItem.orderNr < oldOrderNr &&
            currentItem.orderNr >= newOrderNr) {
          // Item is moving up the list, increase the orderNr of every preceding item by 1
          currentItem.orderNr = currentItem.orderNr + 1;
        }
      }
    }
    // Finally, update the orderNr of the moved item
    item.orderNr = newOrderNr;
  }
  listItems.sort((a, b) => a!.orderNr.compareTo(b!.orderNr));
}

/// A function to handle the stream of flashlist messages
/// accepts a nullable [list] of flashlists and a [message]
/// that extends [SerializableModel].
///
/// It will check for the type of the [message] and manipulate
/// the list [streamItems] accordingly.
void handleFlashlistStreamMessage(
  Ref ref,
  List<Flashlist?> streamItems,
  SerializableModel message,
) async {
  /// [FlashlistBatch] is a message that contains a collection of [Flashlist]
  /// entities. It is sent when the user first connects to the WebSocket.
  if (message is FlashlistBatch) {
    if (streamItems.isNotEmpty) {
      streamItems.clear();
    }
    streamItems.addAll(message.collection);
  }

  /// [Flashlist] is a message that contains a single [Flashlist] entity.
  if (message is Flashlist) {
    streamItems.add(message);
  }

  /// [DeleteFlashlist] is a message that contains the [id] of a [Flashlist]
  /// entity that should be removed from the list.
  if (message is DeleteFlashlist) {
    streamItems.removeWhere((element) => element!.id == message.flashlistId);
  }

  /// [UpdateFlashlist] is a message that contains the [id] of a [Flashlist]
  /// entity that should be updated. It also contains the new [title] and [color]
  /// of the [Flashlist].
  if (message is UpdateFlashlist) {
    final indexToRemove =
        streamItems.indexWhere((element) => element!.id == message.id);
    final itemToRemove = streamItems[indexToRemove];

    streamItems.removeAt(indexToRemove);
    streamItems.insert(
      indexToRemove,
      itemToRemove!.copyWith(
        title: message.title,
        color: message.color,
      ),
    );
  }

  /// FlashlistItem is a message that contains a single [FlashlistItem] entity.
  if (message is FlashlistItem) {
    final flashlistToUpdate =
        getFlashlistByFromStream(streamItems, message.parentId);

    if (flashlistToUpdate!.items == null) {
      flashlistToUpdate.items = <FlashlistItem>[message];
    } else {
      flashlistToUpdate.items!.add(message);
    }
  }

  /// [UpdateFlashlistItem] is a message that contains the [id] of a [FlashlistItem]
  /// entity that should be updated. It also contains the new [title] and [color]
  /// of the [FlashlistItem].
  if (message is DeleteFlashlistItem) {
    final flashListToUpdate =
        getFlashlistByFromStream(streamItems, message.parentId);

    final itemToUpdate = flashListToUpdate!.items!.firstWhere(
      (currentItem) => currentItem!.id == message.id,
      orElse: () => null,
    );

    if (itemToUpdate != null) {
      flashListToUpdate.items!
          .removeWhere((currentItem) => currentItem!.id == message.id);

      // Check if the item still exists in the list before trying to remove it again
      if (flashListToUpdate.items!
          .any((currentItem) => currentItem!.id == message.id)) {
        flashListToUpdate.items!
            .removeWhere((currentItem) => currentItem!.id == message.id);
      }

      updateOrderNrForSiblings(flashListToUpdate.items!, itemToUpdate, null);
    }
  }

  if (message is InsertFlashlistItem) {
    final flashlistToUpdate =
        getFlashlistByFromStream(streamItems, message.item.parentId);

    if (flashlistToUpdate!.items == null) {
      flashlistToUpdate.items = <FlashlistItem>[message.item];
    } else {
      flashlistToUpdate.items!.insert(message.item.orderNr - 1, message.item);
    }

    updateOrderNrForSiblings(
      flashlistToUpdate.items!,
      message.item,
      message.item.orderNr,
    );
  }

  /// [ReOrderFlashlistItem] is a message that contains the [id] of a [FlashlistItem]
  /// entity that should be updated. It also contains the new [orderNr] of the [FlashlistItem].
  if (message is ReOrderFlashlistItem) {
    final flashlistToUpdate =
        getFlashlistByFromStream(streamItems, message.parentId);

    final itemToUpdate = flashlistToUpdate!.items!
        .firstWhere((currentItem) => currentItem!.id == message.id);

    final newOrderNr = message.newOrderNr;

    flashlistToUpdate.items!
        .removeWhere((currentItem) => currentItem!.id == message.id);

    flashlistToUpdate.items!.insert(newOrderNr! - 1, itemToUpdate);

    updateOrderNrForSiblings(
      flashlistToUpdate.items!,
      itemToUpdate!,
      newOrderNr,
    );
  }

  /// [AddUserToFlashlist] is a message that contains the [id] of a [Flashlist]
  /// entity that should be updated. It also contains the [user] that should be added
  /// to [flashlist.authors]. If [flashlist.authors] is null, it will be initialized
  if (message is AddUserToFlashlist) {
    final flashlistToUpdate =
        getFlashlistByFromStream(streamItems, message.flashlistId);

    if (flashlistToUpdate!.authors == null) {
      flashlistToUpdate.authors = <AppUser>[message.user];
    } else {
      flashlistToUpdate.authors?.add(message.user);
    }
  }

  /// [InviteUserToFlashlist] is a message that is sent to a user that is added to a list.
  /// It only bounces the message back to the server.
  /// When JoinFlashlist is sent back to the server we know the invitee has a active session.
  /// To which we want to add a listener for the flashlist.
  if (message is JoinFlashlist) {
    final client = ref.read(clientProvider);

    client.flashlist.sendStreamMessage(message);
  }

  /// [RemoveUserFromFlashlist] is a message that contains the [id] of a [Flashlist]
  /// entity that should be updated. It also contains the [userId] that should be removed
  /// from [flashlist.authors].
  /// Can be sent both by the user that wants to leave the list or by the owner of the list.
  if (message is RemoveUserFromFlashlist) {
    final flashlistToUpdate =
        getFlashlistByFromStream(streamItems, message.flashlistId);

    flashlistToUpdate?.authors!
        .removeWhere((currentAuthor) => currentAuthor!.id == message.userId);
  }

  /// [LeaveFlashlist] is a message that is sent to a user that is removed from a list.
  /// It resets the stream and invalidates the ref.
  if (message is LeaveFlashlist) {
    final client = ref.read(clientProvider);

    client.flashlist.resetStream();

    ref.invalidateSelf();
  }
}
