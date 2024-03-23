import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget to input a new flashlist item
/// Requires [flashlist] and [isAdding]
/// Only visible when [isAdding] is true
/// When the user presses enter, the item is created
class FlashlistItemInput extends ConsumerWidget {
  const FlashlistItemInput({
    super.key,
    required this.flashlist,
    required this.isAdding,
  });

  final Flashlist flashlist;
  final bool isAdding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashlistItemInputTextController = TextEditingController();

    final currentOrderNr =
        flashlist.items != null ? flashlist.items!.length + 1 : 1;

    return isAdding
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            child: Card(
              child: TextField(
                  textInputAction: TextInputAction.send,
                  controller: flashlistItemInputTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    labelText: '#$currentOrderNr',
                  ),
                  onEditingComplete: () {
                    ref.read(flashlistControllerProvider).createFlashlistItem(
                          FlashlistItem(
                            parentId: flashlist.id!,
                            name: flashlistItemInputTextController.text,
                            orderNr: currentOrderNr,
                          ),
                        );
                    flashlistItemInputTextController.clear();
                  }),
            ),
          )
        : const SizedBox();
  }
}
