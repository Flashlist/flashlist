import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
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
    String flashlistItemTitle = '';
    final flashlistItemFormKey = GlobalKey<FormState>();

    final currentOrderNr =
        flashlist.items != null ? flashlist.items!.length + 1 : 1;

    void submit() {
      final isValid = flashlistItemFormKey.currentState!.validate();

      if (!isValid) {
        return;
      }

      flashlistItemFormKey.currentState!.save();

      ref.read(flashlistControllerProvider).createFlashlistItem(
            FlashlistItem(
              parentId: flashlist.id!,
              name: flashlistItemTitle,
              orderNr: currentOrderNr,
            ),
          );
    }

    return isAdding
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            child: Card(
              child: Form(
                key: flashlistItemFormKey,
                child: TextFormField(
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    labelText: '#$currentOrderNr',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return context.localizations.pleaseEnterText;
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    flashlistItemTitle = newValue!;
                  },
                  onFieldSubmitted: (_) {
                    submit();
                  },
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
