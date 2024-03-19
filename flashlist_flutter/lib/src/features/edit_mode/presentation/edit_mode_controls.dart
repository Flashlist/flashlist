import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
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
    final editModeController = ref.read(editModeControllerProvider);

    void onConfirm() {
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
