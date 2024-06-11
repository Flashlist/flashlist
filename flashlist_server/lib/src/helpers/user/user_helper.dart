import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// Helper Class for user-specific methods
/// that are shared among endpoints.
class UserHelper {
  Future<int?> getAuthenticatedUserId(Session session) async {
    final auth = await session.authenticated;
    return auth?.userId;
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

  Future<bool> deleteAccount(Session session) async {
    final int? userId = await getAuthenticatedUserId(session);
    if (userId == null) {
      return false;
    }

    AppUser? appUser = await AppUser.db.findFirstRow(
      session,
      where: (user) => user.id.equals(userId),
    );

    if (appUser == null) {
      return false;
    }

    UserInfo? user = await UserInfo.db.findById(session, userId);

    if (user == null) {
      return false;
    }

    try {
      final String? email = user.email;

      if (email == null) {
        return false;
      }

      await session.db.transaction((transaction) async {
        await AppUser.db.deleteRow(
          session,
          appUser,
          transaction: transaction,
        );

        await session.db.unsafeQuery(
          'DELETE FROM serverpod_user_info WHERE email=\'$email\'',
          transaction: transaction,
        );

        await session.db.unsafeQuery(
          'DELETE FROM serverpod_email_auth WHERE email=\'$email\'',
          transaction: transaction,
        );

        await session.db.unsafeQuery(
          'DELETE FROM serverpod_email_create_request WHERE email=\'$email\'',
          transaction: transaction,
        );

        await session.db.unsafeQuery(
          'DELETE FROM serverpod_email_failed_sign_in WHERE email=\'$email\'',
          transaction: transaction,
        );

        ColumnInt columnInt =
            ColumnInt('userId', Table(tableName: 'serverpod_email_reset'));

        await session.db.unsafeQuery(
          'DELETE FROM serverpod_email_reset WHERE $columnInt=\'$userId\'',
          transaction: transaction,
        );

        ColumnInt columnInt2 =
            ColumnInt('userId', Table(tableName: 'serverpod_auth_key'));

        await session.db.unsafeQuery(
          'DELETE FROM serverpod_auth_key WHERE $columnInt2=\'$userId\'',
          transaction: transaction,
        );

        await session.db.unsafeExecute(
          'DELETE FROM serverpod_email_auth WHERE email=\'$email\'',
          transaction: transaction,
        );

        return true;
      });
    } catch (e) {
      print('Failed to delete account: $e');
      return false;
    }
    return true;
  }
}
