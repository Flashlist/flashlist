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
  if (message is FlashlistBatch) {
    streamItems.addAll(message.collection);
  }

  if (message is Flashlist) {
    streamItems.add(message);
  }

  if (message is DeleteFlashlist) {
    streamItems.removeWhere((element) => element!.id == message.flashlistId);
  }
}
