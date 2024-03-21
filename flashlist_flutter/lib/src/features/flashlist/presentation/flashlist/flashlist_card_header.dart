import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist/flashlist_title.dart';

/// A widget to display the header of a flashlist.
/// Includes the title consisting of [Text] and [TextField] widgets
/// depending if the flashlist is in edit mode or not.
/// It also includes controls to delete and edit the flashlist.
/// SOON: An AvatarGroup representing the users that have access to the flashlist.
class FlashlistCardHeader extends ConsumerWidget {
  const FlashlistCardHeader({
    super.key,
    required this.flashlist,
  });

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editModePanel = ref.watch(editModePanelControllerProvider);

    // This function will launch the edit mode for the flashlist
    // TODO: Implement this cleaner
    void launchEditModeForFlashlist() {
      ref.read(flashlistTitleInputControllerProvider).text = flashlist.title;
      ref
          .read(colorPickerControllerProvider.notifier)
          .takeInt(int.parse(flashlist.color));
      ref.read(editModeControllerProvider).toggleEditMode(flashlist);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
          onPressed:
              editModePanel.isEditMode ? null : launchEditModeForFlashlist,
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
