import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';

/// A Widget representing the title of a Flashlist
/// It will display the title of the flashlist in a Text widget
/// or a TextField if the flashlist is in edit mode
/// The TextField will update the flashlist title when the edit mode is submitted.
class FlashlistTitle extends ConsumerWidget {
  const FlashlistTitle({super.key, required this.flashlist});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editModePanel = ref.watch(editModePanelControllerProvider);
    final textEditingController =
        ref.watch(flashlistTitleInputControllerProvider);

    if (textEditingController.text.isEmpty) {
      textEditingController.text = flashlist.title;
    }

    return editModePanel.isEditMode &&
            editModePanel.flashlistInEditMode == flashlist.id
        ? Expanded(
            child: SizedBox(
            height: 35,
            child: TextField(
              onChanged: (value) {
                textEditingController.text = value;
              },
              onSubmitted: (value) {
                textEditingController.text = value;
              },
              textAlign: TextAlign.center,
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                labelText: 'Title',
              ),
            ),
          ))
        : Text(flashlist.title);
  }
}
