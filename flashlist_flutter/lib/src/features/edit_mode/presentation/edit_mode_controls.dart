import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditModeControls extends ConsumerWidget {
  const EditModeControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editModeController = ref.read(editModeControllerProvider.notifier);
    return Row(
      children: [
        FloatingActionButton(
          backgroundColor: colorSchemeOf(context).onBackground,
          shape: const CircleBorder(),
          onPressed: () {
            editModeController.toggleEditMode();
          },
          child: Icon(
            Icons.check,
            color: colorSchemeOf(context).background,
          ),
        ),
        FloatingActionButton(
          backgroundColor: colorSchemeOf(context).onBackground,
          shape: const CircleBorder(),
          onPressed: () {
            editModeController.toggleEditMode();
          },
          child: Icon(
            Icons.close,
            color: colorSchemeOf(context).background,
          ),
        ),
      ],
    );
  }
}
