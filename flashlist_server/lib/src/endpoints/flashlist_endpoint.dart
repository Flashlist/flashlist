import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class FlashlistEndpoint extends Endpoint {
  Future<int?> getCurrentUserId(Session session) async {
    try {
      final userId = await session.auth.authenticatedUserId;
      if (userId == null) return null;

      return userId;
    } catch (e) {
      return null;
    }
  }

  Future<AppUser?> getCurrentUser(Session session) async {
    try {
      final userId = await getCurrentUserId(session);
      if (userId == null) return null;

      final user = await AppUser.db.findFirstRow(
        session,
        where: (user) => user.id.equals(userId),
      );

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<Flashlist> createFlashlist(
    Session session,
    Flashlist flashlist,
  ) async {
    try {
      final list = await Flashlist.db.insertRow(session, flashlist);
      final userId = await getCurrentUserId(session);
      print(userId);

      FlashlistPermission.db.insertRow(
        session,
        FlashlistPermission(
          flashlistId: list.id!,
          userId: userId!,
          accessLevel: 'owner',
        ),
      );

      return list;
    } catch (e) {
      throw Exception('Failed to create flashlist: $e');
    }
  }

  Future<List<Flashlist>> getFlashlistsForUser(Session session) async {
    try {
      final userId = await getCurrentUserId(session);
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final flashlistPermissions = await FlashlistPermission.db.find(
        session,
        where: (permission) => permission.userId.equals(userId),
      );

      if (flashlistPermissions.isEmpty) {
        return [];
      }

      final usersPermissionFlashlistIds =
          flashlistPermissions.map((e) => e.flashlistId).toSet();

      final flashlistCollection = await Flashlist.db.find(
        session,
        where: (flashlist) => flashlist.id.inSet(usersPermissionFlashlistIds),
      );

      return flashlistCollection;
    } catch (e) {
      throw Exception('Failed to get flashlists for user: $e');
    }
  }

  Future<bool> deleteFlashlist(
    Session session,
    int flashlistId,
  ) async {
    try {
      final userId = await getCurrentUserId(session);
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final flashlistToDelete = await Flashlist.db.findFirstRow(
        session,
        where: (flashlist) => flashlist.id.equals(flashlistId),
      );

      if (flashlistToDelete == null) {
        throw Exception('Flashlist does not exist');
      }

      final permissionsList = await FlashlistPermission.db.find(
        session,
        where: (permission) {
          return permission.userId.equals(userId) &
              permission.flashlistId.equals(flashlistId);
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

  @override
  Future<void> streamOpened(StreamingSession session) async {
    try {
      final currentUser = await getCurrentUser(session);
      setUserObject(session, currentUser);

      final flashlists = await getFlashlistsForUser(session);

      sendStreamMessage(session, FlashlistBatch(collection: flashlists));

      session.messages.addListener('channel', (message) {
        sendStreamMessage(session, message);
      });
    } catch (e) {
      print('Failed to open stream: $e');
    }
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity message) async {
    // final channelName = await parseChannelName(session);
    if (message is Flashlist) {
      final flashlist = await createFlashlist(session, message);
      session.messages.postMessage('channel', flashlist);
    }

    if (message is DeleteFlashlist) {
      await deleteFlashlist(session, message.flashlistId);
      sendStreamMessage(
        session,
        DeleteFlashlist(flashlistId: message.flashlistId),
      );
    }
  }
}
