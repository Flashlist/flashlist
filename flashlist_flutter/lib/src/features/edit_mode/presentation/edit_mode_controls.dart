import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Controls buttons for Edit Mode Panel
/// Confirm and Cancel
/// Confirm will save the changes
/// Cancel will discard the changes
class EditModeControls extends ConsumerWidget {
  const EditModeControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editModeController = ref.watch(editModeControllerProvider);
    final editModePanel = ref.watch(editModePanelControllerProvider);

    final textEditingController =
        ref.watch(flashlistTitleInputControllerProvider);

    final colorPicker = ref.watch(colorPickerControllerProvider);

    final flashlistController = ref.watch(flashlistControllerProvider);

    void onConfirm() {
      flashlistController.updateFlashlist(UpdateFlashlist(
        id: editModePanel.flashlistInEditMode,
        title: textEditingController.text,
        color: colorPicker.color.toColor().value.toString(),
      ));

      editModeController.toggleEditMode(null);
    }

    void onCancel() {
      editModeController.toggleEditMode(null);
    }

    return Row(
      children: [
        // Confirm
        FloatingActionButton(
          backgroundColor: colorSchemeOf(context).onBackground,
          shape: const CircleBorder(),
          onPressed: onConfirm,
          child: Icon(
            Icons.check,
            color: colorSchemeOf(context).background,
          ),
        ),
        // Cancel
        FloatingActionButton(
          backgroundColor: colorSchemeOf(context).onBackground,
          shape: const CircleBorder(),
          onPressed: onCancel,
          child: Icon(
            Icons.close,
            color: colorSchemeOf(context).background,
          ),
        ),
      ],
    );
  }
}
