import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Helper Class for user-specific methods
/// that are shared among endpoints.
class UserHelper {
  Future<int?> getAuthenticatedUserId(Session session) async {
    return await session.auth.authenticatedUserId;
  }

  Future<AppUser?> getAuthenticatedUser(Session session) async {
    try {
      final userId = await getAuthenticatedUserId(session);
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

  Future<AppUser?> getUserByEmail(Session session, String email) async {
    try {
      final user = await AppUser.db.findFirstRow(
        session,
        where: (user) => user.email.equals(email),
      );

      return user;
    } catch (e) {
      throw Exception('Failed to get user by email: $e');
    }
  }
}
