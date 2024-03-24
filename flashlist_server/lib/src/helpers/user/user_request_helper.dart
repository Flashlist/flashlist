import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserRequestHelper {
  Future<UserRequest?> getUserRequestById(
    Session session,
    int userRequestId,
  ) async {
    final request = await UserRequest.db.findFirstRow(
      session,
      where: (req) => req.id.equals(userRequestId),
    );

    if (request == null) {
      throw Exception('Request does not exist');
    }

    return request;
  }

  Future<void> deleteUserRequest(
    Session session,
    int userRequestId,
  ) async {
    final request = await getUserRequestById(session, userRequestId);

    if (request == null) {
      throw Exception('Request does not exist');
    }

    await UserRequest.db.deleteRow(session, request);
  }
}
