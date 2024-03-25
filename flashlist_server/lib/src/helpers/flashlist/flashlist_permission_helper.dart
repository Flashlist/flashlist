import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:flashlist_server/src/helpers/user/user_helper.dart';
import 'package:serverpod/serverpod.dart';

class FlashlistPermissionHelper {
  final userHelper = UserHelper();

  /// Creates a permission with the passed data
  Future<void> createFlashlistPermission(
    Session session,
    int flashlistId,
    int userId,
    String accessLevel,
  ) async {
    try {
      final existingPermission = await FlashlistPermission.db.findFirstRow(
        session,
        where: (permission) {
          return permission.flashlistId.equals(flashlistId) &
              permission.userId.equals(userId);
        },
      );

      if (existingPermission != null) {
        throw Exception('Permission already exists');
      }

      FlashlistPermission.db.insertRow(
        session,
        FlashlistPermission(
          flashlistId: flashlistId,
          userId: userId,
          accessLevel: accessLevel,
        ),
      );
    } catch (e) {
      throw Exception('Failed to create permission: $e');
    }
  }

  /// Returns all permissions for the currently authenticated user
  Future<List<FlashlistPermission>> getFlashlistPermissionsForUser(
    Session session,
  ) async {
    try {
      final userId = await userHelper.getAuthenticatedUserId(session);

      final permissions = await FlashlistPermission.db.find(
        session,
        where: (permission) => permission.userId.equals(userId),
      );

      return permissions;
    } catch (e) {
      throw Exception('Failed to get permissions for user: $e');
    }
  }

  /// Returns all permissions with [parentId] == [flashlistId]
  Future<List<FlashlistPermission?>> getPermissionsByFlashlistId(
    Session session,
    int flashlistId,
  ) async {
    return await FlashlistPermission.db.find(
      session,
      where: (currentPermission) =>
          currentPermission.flashlistId.equals(flashlistId),
    );
  }

  Future<void> deleteFlashlistPermission(
    Session session,
    int flashlistId,
    int userId,
  ) async {
    try {
      final permission = await FlashlistPermission.db.findFirstRow(
        session,
        where: (currentPermission) {
          return currentPermission.flashlistId.equals(flashlistId) &
              currentPermission.userId.equals(userId);
        },
      );

      if (permission == null) {
        throw Exception('Permission does not exist');
      }

      FlashlistPermission.db.deleteRow(session, permission);
    } catch (e) {
      throw Exception('Failed to delete permission: $e');
    }
  }

  /// Deletes all permissions with [flashlistId] == [flashlistId]
  Future<bool> deletePermissionsForFlashlist(
    Session session,
    int flashlistId,
  ) async {
    final listPermissions =
        await getPermissionsByFlashlistId(session, flashlistId);

    for (final permission in listPermissions) {
      FlashlistPermission.db.deleteRow(session, permission!);
    }

    return true;
  }

  /// Checks if a permission exists for the currently
  /// authenticated user and the Flashlist with the given
  /// [flashlistId]
  /// Returns [accessLevel] as String ('owner', 'editor')
  /// or null if no permission exists.
  Future<String?> getUserAccessLevelByFlashlistId(
    Session session,
    int flashlistId,
  ) async {
    try {
      final currentUserId = await userHelper.getAuthenticatedUserId(session);

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

  /// Checks if there are permissions corresponding with the
  /// passed [flashlistId].
  /// Returns a list of [AppUser] objects.
  /// If no permissions are found, an empty list is returned.
  Future<List<AppUser?>> getUsersByFlashlistId(
    Session session,
    int flashlistId,
  ) async {
    final permissions = await getPermissionsByFlashlistId(session, flashlistId);

    if (permissions.isEmpty) return [];

    final userIds = permissions.map((permission) => permission!.userId).toSet();

    final users = await AppUser.db.find(
      session,
      where: (user) => user.id.inSet(userIds),
    );

    return users;
  }

  /// Checks if there are permissions corresponding with the
  /// passed [flashlistId].
  /// Returns a list of [AppUser] objects that are not the
  /// currently authenticated user.
  Future<List<AppUser?>> getCoAuthorsByFlashlistId(
    Session session,
    int flashlistId,
  ) async {
    final authenticatedUserId =
        await userHelper.getAuthenticatedUserId(session);
    final authors = await getUsersByFlashlistId(session, flashlistId);
    final coAuthors = authors
        .where((currentAuthor) => currentAuthor?.id != authenticatedUserId)
        .toList();

    return coAuthors;
  }
}
