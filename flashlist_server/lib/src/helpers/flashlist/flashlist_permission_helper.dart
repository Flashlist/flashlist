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
    FlashlistPermission.db.insertRow(
      session,
      FlashlistPermission(
        flashlistId: flashlistId,
        userId: userId,
        accessLevel: accessLevel,
      ),
    );
  }

  /// Returns all permissions for the currently authenticated user
  Future<List<FlashlistPermission>> getFlashlistPermissionsForUser(
      Session session) async {
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
}
