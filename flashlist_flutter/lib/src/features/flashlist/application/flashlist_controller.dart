import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_stream_message_handler.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';

part 'flashlist_controller.g.dart';

class FlashlistController {
  FlashlistController(this.ref);

  final Ref ref;

  Future<Flashlist?> getFlashlistById(int flashlistId) async {
    final client = ref.read(clientProvider);
    return await client.flashlist.getFlashlistById(flashlistId);
  }

  Future<void> createFlashlist(Flashlist flashlist) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(flashlist);
  }

  Future<void> deleteFlashlist(int flashlistId) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(
      DeleteFlashlist(flashlistId: flashlistId),
    );
  }

  Future<void> updateFlashlist(UpdateFlashlist update) async {
    final client = ref.read(clientProvider);

    final flashlist = await client.flashlist.getFlashlistById(update.id);

    if (flashlist!.title != update.title || flashlist.color != update.color) {
      await client.flashlist.sendStreamMessage(update);
    }
  }

  Future<void> createFlashlistItem(FlashlistItem flashlistItem) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(flashlistItem);
  }

  Future<void> deleteFlashlistItem(DeleteFlashlistItem itemToDelete) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(itemToDelete);
  }

  Future<void> reOrderFlashlistItems(ReOrderFlashlistItem reOrder) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(reOrder);
  }

  Future<void> addUserToFlashlist(AddUserToFlashlist addUserEvent) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(addUserEvent);
  }

  Future<void> inviteUserToFlashlist(
    InviteUserToFlashlist inviteUserEvent,
  ) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(inviteUserEvent);
  }

  Future<void> acceptFlashlistInvite(
    AcceptInviteToFlashlist acceptInvite,
  ) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(acceptInvite);
  }

  Future<void> removeUserFromFlashlist(
    RemoveUserFromFlashlist leaveFlashlist,
  ) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(leaveFlashlist);
  }

  Future<String?> getUserAccessLevelForFlashlist(
    int flashlistId,
  ) async {
    final client = ref.read(clientProvider);
    return await client.flashlist.getUserAccessLevelForFlashlist(flashlistId);
  }
}

@riverpod
FlashlistController flashlistController(Ref ref) => FlashlistController(ref);

@riverpod
Future<Flashlist?> flashlistById(
  FlashlistByIdRef ref,
  int flashlistId,
) async {
  final flashlistController = ref.watch(flashlistControllerProvider);
  return await flashlistController.getFlashlistById(flashlistId);
}

@riverpod
StreamingConnectionHandler streamingConnectionHandler(
  StreamingConnectionHandlerRef ref,
) {
  return StreamingConnectionHandler(
    client: ref.watch(clientProvider),
    listener: (connectionState) {},
  );
}

@riverpod
Stream<List<Flashlist?>> flashlistsForUser(FlashlistsForUserRef ref) async* {
  final client = ref.watch(clientProvider);
  final streamingConnectionHandler =
      ref.watch(streamingConnectionHandlerProvider);

  client.flashlist.resetStream();

  streamingConnectionHandler.connect();

  ref.onDispose(() {
    streamingConnectionHandler.dispose();
  });

  var streamItems = <Flashlist>[];
  await for (final message in client.flashlist.stream) {
    handleFlashlistStreamMessage(ref, streamItems, message);
    yield streamItems;
  }
}

@riverpod
Future<String?> userAccessLevelForFlashlist(
  UserAccessLevelForFlashlistRef ref,
  int flashlistId,
) async {
  final flashlistController = ref.watch(flashlistControllerProvider);
  return await flashlistController.getUserAccessLevelForFlashlist(flashlistId);
}
