import 'package:flashlist_client/flashlist_client.dart';

/// A function to handle the stream of flashlist messages
/// accepts a nullable [list] of flashlists and a [message]
/// that extends [SerializableEntity].
///
/// It will check for the type of the [message] and manipulate
/// the list [streamItems] accordingly.
void handleFlashlistStreamMessage(
  List<Flashlist?> streamItems,
  SerializableEntity message,
) {
  /// [FlashlistBatch] is a message that contains a collection of [Flashlist]
  /// entities. It is sent when the user first connects to the WebSocket.
  if (message is FlashlistBatch) {
    streamItems.addAll(message.collection);
  }

  /// [Flashlist] is a message that contains a single [Flashlist] entity.
  if (message is Flashlist) {
    streamItems.add(message);
  }

  /// [DeleteFlashlist] is a message that contains the [id] of a [Flashlist]
  /// entity that should be removed from the list.
  if (message is DeleteFlashlist) {
    streamItems.removeWhere((element) => element!.id == message.flashlistId);
  }

  /// [UpdateFlashlist] is a message that contains the [id] of a [Flashlist]
  /// entity that should be updated. It also contains the new [title] and [color]
  /// of the [Flashlist].
  if (message is UpdateFlashlist) {
    final indexToRemove =
        streamItems.indexWhere((element) => element!.id == message.id);
    final itemToRemove = streamItems[indexToRemove];

    streamItems.removeAt(indexToRemove);
    streamItems.insert(
      indexToRemove,
      itemToRemove!.copyWith(
        title: message.title,
        color: message.color,
      ),
    );
  }
}
