import 'package:serverpod/serverpod.dart';

import 'package:flashlist_server/src/generated/protocol.dart';

class FlashlistEndpoint extends Endpoint {
  Future<int?> _getCurrentUserId(Session session) async {
    return await session.auth.authenticatedUserId;
  }

  Future<AppUser?> _getCurrentUser(Session session) async {
    try {
      final userId = await _getCurrentUserId(session);
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final user = await AppUser.db.findFirstRow(
        session,
        where: (user) => user.id.equals(userId),
      );

      return user;
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }

  /// Creates a new flashlist from the given [flashlist] object.
  /// Also creates a new permission for the currently authenticated user
  /// with access level 'owner'.
  Future<Flashlist> createFlashlist(
    Session session,
    Flashlist flashlist,
  ) async {
    try {
      final newFlashlist = await Flashlist.db.insertRow(session, flashlist);
      final userId = await _getCurrentUserId(session);

      FlashlistPermission.db.insertRow(
        session,
        FlashlistPermission(
          flashlistId: newFlashlist.id!,
          userId: userId!,
          accessLevel: 'owner',
        ),
      );

      return newFlashlist;
    } catch (e) {
      throw Exception('Failed to create flashlist: $e');
    }
  }

  // Returns all permissions for the (currently) authenticated user
  Future<List<FlashlistPermission>> _getFlashlistPermissionsForUser(
      Session session) async {
    try {
      final userId = await _getCurrentUserId(session);

      final permissions = await FlashlistPermission.db.find(
        session,
        where: (permission) => permission.userId.equals(userId),
      );

      return permissions;
    } catch (e) {
      throw Exception('Failed to get permissions for user: $e');
    }
  }

  /// Checks if the currently authenticated user has permission
  /// to view the flashlist with the given [id].
  /// Returns true if the user has permission, false otherwise.
  Future<String?> _doesUserHavePermission(
      Session session, int flashlistId) async {
    try {
      final currentUserId = await _getCurrentUserId(session);

      final permission = await FlashlistPermission.db.findFirstRow(
        session,
        where: (permission) {
          return permission.flashlistId.equals(flashlistId) &
              permission.userId.equals(currentUserId);
        },
      );

      if (permission == null) {
        return null;
      }

      return permission.accessLevel;
    } catch (e) {
      throw Exception('Failed to check flashlist permission: $e');
    }
  }

  /// Returns all flashlists that the currently authenticated user has permission to view.
  /// Returns an empty list if the user has no permissions.
  Future<List<Flashlist>> getFlashlistsForUser(Session session) async {
    try {
      final permissionsForUser = await _getFlashlistPermissionsForUser(session);

      if (permissionsForUser.isEmpty) {
        return [];
      }

      final permissionsForUserIds =
          permissionsForUser.map((e) => e.flashlistId).toSet();

      final flashlistCollection = await Flashlist.db.find(
        session,
        where: (flashlist) => flashlist.id.inSet(permissionsForUserIds),
      );

      final flashlistItemsCollection = await FlashlistItem.db.find(
        session,
        where: (item) => item.parentId.inSet(permissionsForUserIds),
      );

      for (final flashlist in flashlistCollection) {
        flashlist.items = flashlistItemsCollection
            .where((item) => item.parentId == flashlist.id)
            .toList();
        flashlist.items!.sort((a, b) => a!.orderNr.compareTo(b!.orderNr));
      }

      return flashlistCollection;
    } catch (e) {
      throw Exception('Failed to get flashlists for user: $e');
    }
  }

  /// Returns the flashlist with the given [flashlistId].
  /// Throws an exception if the user does not have permission to view the flashlist.
  /// Returns null if the flashlist does not exist.
  Future<Flashlist?> getFlashlistById(Session session, int flashlistId) async {
    try {
      if (await _doesUserHavePermission(session, flashlistId) == null) {
        throw Exception('User does not have permission to view flashlist');
      }

      final flashlist = await Flashlist.db.findFirstRow(
        session,
        where: (flashlist) => flashlist.id.equals(flashlistId),
      );

      return flashlist;
    } catch (e) {
      throw Exception('Failed to get flashlist by id: $e');
    }
  }

  /// Deletes the flashlist with the given [flashlistId].
  /// Throws an exception if the user does not have permission to delete the flashlist.
  Future<bool> deleteFlashlist(
    Session session,
    int flashlistId,
  ) async {
    try {
      final userId = await _getCurrentUserId(session);

      final flashlistToDelete = await getFlashlistById(session, flashlistId);

      if (flashlistToDelete == null) {
        throw Exception('Flashlist does not exist');
      }

      final permissionsList = await FlashlistPermission.db.find(
        session,
        where: (permission) {
          return permission.flashlistId.equals(flashlistId) &
              permission.userId.equals(userId);
        },
      );

      if (permissionsList.isEmpty) {
        throw Exception('User does not have permission to delete flashlist');
      }

      for (final permission in permissionsList) {
        await FlashlistPermission.db.deleteRow(
          session,
          permission,
        );
      }

      await Flashlist.db.deleteRow(
        session,
        flashlistToDelete,
      );

      return true;
    } catch (e) {
      throw Exception('Failed to delete flashlist: $e');
    }
  }

  /// Updates the flashlist with [id] matching the [update] object.
  /// Throws an exception if the user does not have permission to update the flashlist.
  /// Returns the updated flashlist if successful.
  Future<Flashlist> updateFlashlist(
    Session session,
    UpdateFlashlist update,
  ) async {
    try {
      final flashlistToUpdate = await getFlashlistById(session, update.id);

      return await Flashlist.db.updateRow(
        session,
        flashlistToUpdate!.copyWith(
          title: update.title,
          color: update.color,
        ),
      );
    } catch (e) {
      throw Exception('Failed to update flashlist: $e');
    }
  }

  /// Creates a new flashlist item from the given [flashlistItem] object.
  /// Returns the created flashlist item if successful.
  Future<FlashlistItem> createFlashlistItem(
    Session session,
    FlashlistItem flashlistItem,
  ) async {
    try {
      return await FlashlistItem.db.insertRow(session, flashlistItem);
    } catch (e) {
      throw Exception('Failed to create flashlist item: $e');
    }
  }

  /// Updates the orderNr for all siblings of the given [flashlistItem].
  /// If [newOrderNr] is null, the item is being deleted and the orderNr for all
  /// siblings coming after the item should be reduced by 1.
  /// If [newOrderNr] is not null, the item is being moved and the orderNr for all
  /// siblings coming after the item should be increased or decreased accordingly.
  Future<void> _updateOrderNrForSiblings(
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

      await _updateOrderNrForSiblings(
        session,
        flashlistItemToDelete,
        null,
      );

      return true;
    } catch (e) {
      throw Exception('Failed to delete flashlist item: $e');
    }
  }

  /// Parses the channel name for the currently authenticated user.
  /// To be used in StreamingSessions.
  Future<String> _parseUserChannelName(Session session) async {
    final id = await session.auth.authenticatedUserId;
    return 'channel-flashlist-user-$id';
  }

  String _parseListChannelName(int listId) {
    return 'flashlist-channel-$listId';
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    try {
      final currentUser = await _getCurrentUser(session);
      setUserObject(session, currentUser);

      final channelName = await _parseUserChannelName(session);

      final flashlists = await getFlashlistsForUser(session);

      sendStreamMessage(session, FlashlistBatch(collection: flashlists));

      session.messages.addListener(channelName, (message) {
        sendStreamMessage(session, message);
      });

      for (final flashlist in flashlists) {
        session.messages.addListener('flashlist-channel-${flashlist.id}',
            (message) {
          sendStreamMessage(session, message);
        });
      }
    } catch (e) {
      print('Failed to open stream: $e');
    }
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableEntity message,
  ) async {
    final userChannel = await _parseUserChannelName(session);

    if (message is Flashlist) {
      final flashlist = await createFlashlist(session, message);

      session.messages.postMessage(userChannel, flashlist);

      session.messages.addListener(_parseListChannelName(flashlist.id!),
          (message) {
        sendStreamMessage(session, message);
      });
    }

    if (message is DeleteFlashlist) {
      await deleteFlashlist(session, message.flashlistId);
      session.messages
          .postMessage(_parseListChannelName(message.flashlistId), message);

      session.messages.removeListener(
        _parseListChannelName(message.flashlistId),
        (message) {
          sendStreamMessage(session, message);
        },
      );
    }

    if (message is UpdateFlashlist) {
      await updateFlashlist(session, message);

      session.messages.postMessage(_parseListChannelName(message.id), message);
    }

    if (message is FlashlistItem) {
      final flashlistItem = await createFlashlistItem(session, message);
      session.messages
          .postMessage(_parseListChannelName(message.parentId), flashlistItem);
    }

    if (message is DeleteFlashlistItem) {
      await deleteFlashlistItem(session, message);
      session.messages
          .postMessage(_parseListChannelName(message.parentId), message);
    }

    if (message is ReOrderFlashlistItem) {
      final reOrder = await FlashlistItem.db.findFirstRow(
        session,
        where: (item) => item.id.equals(message.id),
      );
      await _updateOrderNrForSiblings(session, reOrder!, message.newOrderNr!);
      session.messages
          .postMessage(_parseListChannelName(message.parentId), message);
    }
  }
}
