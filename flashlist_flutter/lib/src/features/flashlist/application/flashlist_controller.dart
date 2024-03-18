import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_stream_message_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';

part 'flashlist_controller.g.dart';

class FlashlistController {
  FlashlistController(this.ref);

  final Ref ref;

  Future<List<Flashlist?>> getFlashlistsForUser() async {
    final client = ref.read(clientProvider);
    return await client.flashlist.getFlashlistsForUser();
  }

  Future<void> createFlashlist(Flashlist flashlist) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(flashlist);
    // client.flashlist.createFlashlist(flashlist);
  }

  Future<void> deleteFlashlist(int flashlistId) async {
    final client = ref.read(clientProvider);
    await client.flashlist.sendStreamMessage(
      DeleteFlashlist(flashlistId: flashlistId),
    );
  }
}

@riverpod
FlashlistController flashlistController(Ref ref) => FlashlistController(ref);

@riverpod
Stream<List<Flashlist?>> flashlistsForUser(FlashlistsForUserRef ref) async* {
  final client = ref.watch(clientProvider);

  await client.openStreamingConnection();

  ref.onDispose(() async {
    await client.closeStreamingConnection();
  });

  var streamItems = <Flashlist>[];

  await for (final message in client.flashlist.stream) {
    handleFlashlistStreamMessage(streamItems, message);
    yield streamItems;
  }
}
