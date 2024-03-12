import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AppUserEndpoint extends Endpoint {
  Future<AppUser?> getCurrentUserObject(Session session) async {
    final currentUserId = await session.auth.authenticatedUserId;

    return await AppUser.db.findFirstRow(
      session,
      where: (appUser) => appUser.userId.equals(currentUserId),
    );
  }
}
