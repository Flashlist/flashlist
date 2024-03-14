import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AppUserEndpoint extends Endpoint {
  // Retrieve User
  Future<AppUser?> getCurrentUser(Session session) async {
    final currentUserId = await session.auth.authenticatedUserId;

    return await AppUser.db.findFirstRow(
      session,
      where: (appUser) => appUser.userId.equals(currentUserId),
    );
  }

  Future<AppUser?> getUserById(Session session, int userId) async {
    return await AppUser.db.findFirstRow(
      session,
      where: (appUser) => appUser.userId.equals(userId),
    );
  }

  Future<AppUser?> getUserByUsername(Session session, String username) async {
    return await AppUser.db.findFirstRow(
      session,
      where: (appUser) => appUser.username.equals(username),
    );
  }

  Future<AppUser?> getUserByEmail(Session session, String email) async {
    return await AppUser.db.findFirstRow(
      session,
      where: (appUser) => appUser.email.equals(email),
    );
  }

  // Handle User Requests
  Future<UserRequest?> getRequestById(Session session, int requestId) async {
    return await UserRequest.db.findById(session, requestId);
  }

  Future<List<UserRequest?>> getRequestsForUser(Session session) async {
    try {
      final currentUser = await getCurrentUser(session);
      if (currentUser == null) {
        throw Exception('Current user not found');
      }

      return await UserRequest.db.find(
        session,
        where: (request) => request.userId2.equals(currentUser.userId),
      );
    } catch (e) {
      print('Failed to get requests for user: $e');
      rethrow;
    }
  }

  Future<void> removeRequest(Session session, int requestId) async {
    try {
      final request = await getRequestById(session, requestId);

      if (request == null) {
        throw Exception('Request not found');
      }

      await UserRequest.db.deleteRow(
        session,
        request,
      );
    } catch (e) {
      print('Failed to remove request: $e');
      rethrow;
    }
  }

  // Handle User Requests
  Future<void> sendConnectionRequestByEmail(
    Session session,
    String email,
  ) async {
    try {
      // Get receiver by email
      final user = await getUserByEmail(session, email);
      if (user == null) {
        // If the user does not exist, do nothing
        return;
      }
      // get current user
      final currentUser = await getCurrentUser(session);
      if (currentUser == null) {
        throw Exception('Current user not found');
      }

      // check for existing connection
      final existingConnection = await UserRelation.db.findFirstRow(
        session,
        where: (relation) {
          return (relation.userId1.equals(currentUser.userId) &
                  relation.userId2.equals(user.userId)) |
              (relation.userId1.equals(user.userId) &
                  relation.userId2.equals(currentUser.userId));
        },
      );

      // check for existing request
      final existingRequest = await UserRequest.db.findFirstRow(
        session,
        where: (request) {
          return request.userId1.equals(currentUser.userId) &
              request.userId2.equals(user.userId);
        },
      );

      // if there is an existing connection or request, do nothing
      if (existingConnection != null || existingRequest != null) {
        return;
      }

      // Save request
      final requestResponse = await UserRequest.db.insertRow(
        session,
        UserRequest(
          userId1: currentUser.userId,
          userId2: user.userId,
          type: 'connection',
          timestamp: DateTime.now(),
        ),
      );

      // Save notification
      await Notification.db.insertRow(
        session,
        Notification(
          userId: user.userId,
          type: 'connection_request',
          timestamp: DateTime.now(),
          isRead: false,
          requestId: requestResponse.id!,
        ),
      );
    } catch (e) {
      print('Failed to send connection request: $e');
      rethrow;
    }
  }

  // Handle User Connections
  Future<void> acceptConnectionRequest(
    Session session,
    int requestId,
  ) async {
    try {
      final request = await UserRequest.db.findById(session, requestId);
      if (request == null || request.id == null) {
        throw Exception('Request not found');
      }

      final currentUser = await getCurrentUser(session);
      if (currentUser == null) {
        throw Exception('Current user not found');
      }

      if (request.userId2 != currentUser.userId) {
        throw Exception('User not authorized');
      }

      await UserRelation.db.insertRow(
          session,
          UserRelation(
            userId1: request.userId1,
            userId2: request.userId2,
            timestamp: DateTime.now(),
            type: 'connection',
          ));

      // check if pending request exists vice versa
      final oppositeRequest = await UserRequest.db.findFirstRow(
        session,
        where: (currentRequest) {
          return currentRequest.userId1.equals(request.userId2) &
              currentRequest.userId2.equals(request.userId1);
        },
      );
      // if it exists, remove it
      if (oppositeRequest != null) {
        await removeRequest(session, oppositeRequest.id!);
      }

      // remove initial request that was accepted
      await removeRequest(session, requestId);
    } catch (e) {
      print('Failed to accept connection request: $e');
      rethrow;
    }
  }

  // Handle User Connections
  Future<List<AppUser>> getConnections(Session session) async {
    try {
      final currentUser = await getCurrentUser(session);
      if (currentUser == null) {
        throw Exception('Current user not found');
      }

      final connections = await UserRelation.db.find(
        session,
        where: (relation) {
          return relation.userId1.equals(currentUser.userId) |
              relation.userId2.equals(currentUser.userId);
        },
      );

      if (connections.isEmpty) {
        return [];
      }

      final userIds = connections.map((connection) {
        if (connection.userId1 == currentUser.userId) {
          return connection.userId2;
        } else {
          return connection.userId1;
        }
      }).toList();

      return await AppUser.db.find(
        session,
        where: (user) => user.userId.inSet(userIds.toSet()),
      );
    } catch (e) {
      print('Failed to get connections: $e');
      rethrow;
    }
  }
}
