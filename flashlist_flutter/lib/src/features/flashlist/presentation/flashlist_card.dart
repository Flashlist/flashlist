import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_title.dart';

/// A widget to display a single flashlist
class FlashlistCard extends ConsumerWidget {
  const FlashlistCard({super.key, required this.flashlist});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editModePanel = ref.watch(editModePanelControllerProvider);

    final colorPicker = ref.watch(colorPickerControllerProvider);

    final flashlistColor = editModePanel.flashlistInEditMode == flashlist.id
        ? colorPicker.color.toColor()
        : Color(int.parse(flashlist.color));

    // This function will launch the edit mode for the flashlist
    // TODO: Implement this cleaner
    void launchEditModeForFlashlist() {
      ref.read(flashlistTitleInputControllerProvider).text = flashlist.title;
      ref
          .read(colorPickerControllerProvider.notifier)
          .takeInt(int.parse(flashlist.color));
      ref.read(editModeControllerProvider).toggleEditMode(flashlist);
    }

    return AnimatedContainer(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: flashlistColor,
      ),
      duration: const Duration(milliseconds: 00),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    ref
                        .read(flashlistControllerProvider)
                        .deleteFlashlist(flashlist.id!);
                  },
                  icon: const Icon(Icons.delete),
                ),
                FlashlistTitle(
                  flashlist: flashlist,
                ),
                IconButton(
                  onPressed: editModePanel.isEditMode
                      ? null
                      : launchEditModeForFlashlist,
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
