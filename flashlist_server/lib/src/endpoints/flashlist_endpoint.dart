import 'package:flashlist_server/src/helpers/flashlist/flashlist_item_helper.dart';
import 'package:flashlist_server/src/helpers/flashlist/flashlist_permission_helper.dart';
import 'package:flashlist_server/src/helpers/user/user_helper.dart';
import 'package:serverpod/serverpod.dart';

import 'package:flashlist_server/src/generated/protocol.dart';

class FlashlistEndpoint extends Endpoint {
  final userHelper = UserHelper();

  final flashlistItemHelper = FlashlistItemHelper();

  final flashlistPermissionHelper = FlashlistPermissionHelper();

  /// Creates a new flashlist from the given [flashlist] object.
  /// Also creates a new permission for the currently authenticated user
  /// with access level 'owner'.
  Future<Flashlist> createFlashlist(
    Session session,
    Flashlist flashlist,
  ) async {
    try {
      final newFlashlist = await Flashlist.db.insertRow(session, flashlist);
      final userId = await userHelper.getAuthenticatedUserId(session);

      await flashlistPermissionHelper.createFlashlistPermission(
        session,
        newFlashlist.id!,
        userId!,
        'owner',
      );

      return newFlashlist;
    } catch (e) {
      throw Exception('Failed to create flashlist: $e');
    }
  }

  /// Returns all flashlists that the currently authenticated user has permission to view.
  /// Returns an empty list if the user has no permissions.
  Future<List<Flashlist>> getFlashlistsForUser(Session session) async {
    try {
      final permissionsForUser = await flashlistPermissionHelper
          .getFlashlistPermissionsForUser(session);

      if (permissionsForUser.isEmpty) {
        return [];
      } else {
        final permissionsForUserIds =
            permissionsForUser.map((e) => e.flashlistId).toSet();

        final flashlistCollection = await Flashlist.db.find(
          session,
          where: (flashlist) => flashlist.id.inSet(permissionsForUserIds),
        );

        for (final flashlist in flashlistCollection) {
          flashlist.items = await flashlistItemHelper
              .getFlashlistItemsByFlashlistId(session, flashlist.id!);
        }

        return flashlistCollection;
      }
    } catch (e) {
      throw Exception('Failed to get flashlists for user: $e');
    }
  }

  /// Returns the flashlist with the given [flashlistId].
  /// Throws an exception if the user does not have permission to view the flashlist.
  /// Returns null if the flashlist does not exist.
  Future<Flashlist?> getFlashlistById(Session session, int flashlistId) async {
    try {
      final userAccessLevel = await flashlistPermissionHelper
          .getUserAccessLevelByFlashlistId(session, flashlistId);

      if (userAccessLevel == null) {
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
      final accessLevel = await flashlistPermissionHelper
          .getUserAccessLevelByFlashlistId(session, flashlistId);

      if (accessLevel == null || accessLevel != 'owner') {
        throw Exception('User cannot delete Flashlist');
      }

      final flashlistToDelete = await getFlashlistById(session, flashlistId);

      if (flashlistToDelete == null) {
        throw Exception('Flashlist does not exist');
      }

      await flashlistPermissionHelper.deletePermissionsForFlashlist(
        session,
        flashlistId,
      );

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

      await flashlistItemHelper.updateOrderNumbers(
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

  String _parseChannelNameForList(int listId) {
    return 'flashlist-channel-$listId';
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    try {
      final currentUser = await userHelper.getAuthenticatedUser(session);
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

    /// Add Flashlist to db
    /// Post list to [userChannel]
    /// Subscribe to [listChannel]
    if (message is Flashlist) {
      final flashlist = await createFlashlist(session, message);

      session.messages.postMessage(userChannel, flashlist);

      session.messages.addListener(_parseChannelNameForList(flashlist.id!),
          (message) {
        sendStreamMessage(session, message);
      });
    }

    /// Delete Flashlist from db
    /// Post message to [listChannel]
    /// Unsubscribe [listChannel]
    if (message is DeleteFlashlist) {
      await deleteFlashlist(session, message.flashlistId);

      session.messages.postMessage(
        _parseChannelNameForList(message.flashlistId),
        message,
      );

      session.messages.removeListener(
        _parseChannelNameForList(message.flashlistId),
        (message) {
          sendStreamMessage(session, message);
        },
      );
    }

    /// Update Flashlist
    /// Post message to [listChannel]
    if (message is UpdateFlashlist) {
      await updateFlashlist(session, message);

      session.messages.postMessage(
        _parseChannelNameForList(message.id),
        message,
      );
    }

    /// Add FlashlistItem
    /// Post message to [listChannel]
    if (message is FlashlistItem) {
      final flashlistItem = await createFlashlistItem(session, message);

      session.messages.postMessage(
        _parseChannelNameForList(message.parentId),
        flashlistItem,
      );
    }

    /// Delete FlashlistItem
    /// Post message to [listChannel]
    if (message is DeleteFlashlistItem) {
      await deleteFlashlistItem(session, message);

      session.messages.postMessage(
        _parseChannelNameForList(message.parentId),
        message,
      );
    }

    /// Changes [orderNr] of given item
    /// Adjust siblings
    /// Post message to [listChannel]
    if (message is ReOrderFlashlistItem) {
      final itemToReOrder = await FlashlistItem.db.findFirstRow(
        session,
        where: (item) => item.id.equals(message.id),
      );

      await flashlistItemHelper.updateOrderNumbers(
          session, itemToReOrder!, message.newOrderNr!);

      session.messages.postMessage(
        _parseChannelNameForList(message.parentId),
        message,
      );
    }
  }
}
