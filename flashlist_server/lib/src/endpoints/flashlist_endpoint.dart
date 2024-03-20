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

  /// Parses the channel name for the currently authenticated user.
  /// To be used in StreamingSessions.
  Future<String> _parseChannelName(Session session) async {
    final id = await session.auth.authenticatedUserId;
    return 'channel-flashlist-user-$id';
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    try {
      final currentUser = await _getCurrentUser(session);
      setUserObject(session, currentUser);

      final channelName = await _parseChannelName(session);

      final flashlists = await getFlashlistsForUser(session);

      sendStreamMessage(session, FlashlistBatch(collection: flashlists));

      session.messages.addListener(channelName, (message) {
        sendStreamMessage(session, message);
      });
    } catch (e) {
      print('Failed to open stream: $e');
    }
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity message) async {
    final channelName = await _parseChannelName(session);

    if (message is Flashlist) {
      final flashlist = await createFlashlist(session, message);
      session.messages.postMessage(channelName, flashlist);
    }

    if (message is DeleteFlashlist) {
      await deleteFlashlist(session, message.flashlistId);
      session.messages.postMessage(channelName, message);
    }

    if (message is UpdateFlashlist) {
      await updateFlashlist(session, message);

      session.messages.postMessage(channelName, message);
    }
  }
}
