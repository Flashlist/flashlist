import 'package:serverpod/serverpod.dart';

import 'package:flashlist_server/src/generated/protocol.dart';
import 'package:flashlist_server/src/helpers/flashlist/flashlist_helper.dart';
import 'package:flashlist_server/src/helpers/flashlist/flashlist_item_helper.dart';
import 'package:flashlist_server/src/helpers/flashlist/flashlist_permission_helper.dart';
import 'package:flashlist_server/src/helpers/user/user_helper.dart';
import 'package:flashlist_server/src/helpers/user/user_request_helper.dart';

class FlashlistEndpoint extends Endpoint {
  final flashlistHelper = FlashlistHelper();
  final flashlistItemHelper = FlashlistItemHelper();

  final userHelper = UserHelper();
  final userRequestHelper = UserRequestHelper();
  final flashlistPermissionHelper = FlashlistPermissionHelper();

  Future<Flashlist?> getFlashlistById(
    Session session,
    int flashlistId,
  ) async {
    return await flashlistHelper.getFlashlistById(session, flashlistId);
  }

  Future<String?> getUserAccessLevelForFlashlist(
    Session session,
    int flashlistId,
  ) async {
    return await flashlistPermissionHelper.getUserAccessLevelByFlashlistId(
      session,
      flashlistId,
    );
  }

  String _parseChannelNameForUser(int userId) {
    return 'user-channel-$userId';
  }

  String _parseChannelNameForList(int listId) {
    return 'flashlist-channel-$listId';
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    try {
      final currentUser = await userHelper.getAuthenticatedUser(session);
      setUserObject(session, currentUser);

      final channelName = _parseChannelNameForUser(currentUser!.id!);

      final flashlists = await flashlistHelper.getFlashlistsForUser(session);

      sendStreamMessage(session, FlashlistBatch(collection: flashlists));

      session.messages.addListener(channelName, (message) {
        sendStreamMessage(session, message);
      });

      for (final flashlist in flashlists) {
        session.messages.addListener(_parseChannelNameForList(flashlist.id!),
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
    /// Add Flashlist to db
    /// Post list to [userChannel]
    /// Subscribe to [listChannel]
    if (message is Flashlist) {
      final flashlist = await flashlistHelper.createFlashlist(session, message);

      session.messages.postMessage(
        _parseChannelNameForUser(
          getUserObject(session).id,
        ),
        flashlist,
      );

      session.messages.addListener(_parseChannelNameForList(flashlist.id!),
          (message) {
        sendStreamMessage(session, message);
      });
    }

    /// Delete Flashlist from db
    /// Post message to [listChannel]
    /// Unsubscribe [listChannel]
    if (message is DeleteFlashlist) {
      await flashlistHelper.deleteFlashlist(session, message.flashlistId);

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
      await flashlistHelper.updateFlashlist(session, message);

      session.messages.postMessage(
        _parseChannelNameForList(message.id),
        message,
      );
    }

    /// Add FlashlistItem
    /// Post message to [listChannel]
    if (message is FlashlistItem) {
      final flashlistItem =
          await flashlistItemHelper.createFlashlistItem(session, message);

      session.messages.postMessage(
        _parseChannelNameForList(message.parentId),
        flashlistItem,
      );
    }

    /// Delete FlashlistItem
    /// Post message to [listChannel]
    if (message is DeleteFlashlistItem) {
      await flashlistItemHelper.deleteFlashlistItem(session, message);

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

    /// Adds user to Flashlist
    /// By creating a new [FlashlistPermission]
    /// Posts [JoinFlashlist] to [userChannel]
    /// Where it is sent back to to trigger the [JoinFlashlist]
    /// event below, when the joining user is online/listening to his channel
    if (message is AddUserToFlashlist) {
      await flashlistPermissionHelper.createFlashlistPermission(
        session,
        message.flashlistId,
        message.user.id!,
        message.accessLevel,
      );

      session.messages.postMessage(
        _parseChannelNameForList(message.flashlistId),
        message,
      );

      session.messages.postMessage(
        _parseChannelNameForUser(message.user.id!),
        JoinFlashlist(
          user: message.user,
          flashlistId: message.flashlistId,
          accessLevel: message.accessLevel,
        ),
      );
    }

    /// This is sent back by the user who was just added to the flashlist,
    /// if it is sent back the this means the user has an active session and
    /// a listener to the [listChannel] is added.
    if (message is JoinFlashlist) {
      final flashlist = await flashlistHelper.getFlashlistByIdWithAttachments(
        session,
        message.flashlistId,
      );

      session.messages.postMessage(
        _parseChannelNameForUser(message.user.id!),
        flashlist!,
      );

      session.messages.addListener(
        _parseChannelNameForList(message.flashlistId),
        (message) {
          sendStreamMessage(session, message);
        },
      );
    }

    /// Checks if a user with this email-address exists
    /// If it does, a [UserRequest] is created
    if (message is InviteUserToFlashlist) {
      final invitedUser =
          await userHelper.getUserByEmail(session, message.email);

      if (invitedUser == null) {
        throw Exception('User does not exist');
      }

      await UserRequest.db.insertRow(
        session,
        UserRequest(
          userId1: getUserObject(session).id,
          userId2: invitedUser.userId,
          type: 'join_flashlist',
          data: message.flashlistId,
          timestamp: DateTime.now(),
        ),
      );
    }

    /// Accepts a [UserRequest] to join a flashlist
    /// Checks if a request exists with the given [requestId]
    /// If it does, the [Flashlist] is fetched with it's attachments
    /// A [FlashlistPermission] is created for the user
    /// The [UserRequest] is deleted
    /// The [Flashlist] is posted to the [userChannel]
    /// The user is added to the [listChannel]
    /// A listener is added to the [listChannel]
    if (message is AcceptInviteToFlashlist) {
      final request = await userRequestHelper.getUserRequestById(
        session,
        message.requestId,
      );

      final flashlist = await flashlistHelper.getFlashlistByIdWithAttachments(
        session,
        request!.data!,
      );

      await flashlistPermissionHelper.createFlashlistPermission(
        session,
        request.data!,
        getUserObject(session).id,
        'editor',
      );

      await userRequestHelper.deleteUserRequest(session, request.id!);

      session.messages.postMessage(
        _parseChannelNameForUser(getUserObject(session).id),
        flashlist!,
      );

      session.messages.postMessage(
        _parseChannelNameForList(request.data!),
        AddUserToFlashlist(
          user: getUserObject(session),
          flashlistId: message.flashlistId,
          accessLevel: message.accessLevel,
        ),
      );

      session.messages.addListener(
        _parseChannelNameForList(request.data!),
        (message) {
          sendStreamMessage(session, message);
        },
      );
    }

    /// Removes a user from a flashlist
    /// Deletes the [FlashlistPermission] for the user
    /// Posts the message to the [listChannel] where it will remove the user from the author-list
    /// Posts [DeleteFlashlist] to the [userChannel] where it will remove the list from the stream
    /// Removes the listener from the [listChannel]
    /// Posts [LeaveFlashlist] to the [userChannel] where it will reset the stream
    if (message is RemoveUserFromFlashlist) {
      await flashlistPermissionHelper.deleteFlashlistPermission(
        session,
        message.flashlistId,
        message.userId,
      );

      session.messages.postMessage(
        _parseChannelNameForList(message.flashlistId),
        message,
      );

      /// When received in the frontend, LeaveFlashlist will reset the stream
      /// and invalidate the ref, which will trigger a re-fetch of the flashlists
      session.messages.postMessage(
        _parseChannelNameForUser(message.userId),
        LeaveFlashlist(
          flashlistId: message.flashlistId,
          userId: message.userId,
        ),
      );
    }
  }
}
