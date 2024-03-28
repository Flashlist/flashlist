import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/share/share_modal.dart';
import 'package:flashlist_flutter/src/shared/confirm_dialog.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';

/// A [PopupMenuButton] to display the options for a flashlist
/// Includes the options to edit, share, and delete the flashlist
class FlashlistMenu extends ConsumerWidget {
  const FlashlistMenu(this.flashlist, {super.key});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This function will launch the edit mode for the flashlist
    // TODO: Implement this cleaner
    void launchEditModeForFlashlist() {
      ref.read(flashlistTitleInputControllerProvider).text = flashlist.title;
      ref
          .read(colorPickerControllerProvider.notifier)
          .takeInt(int.parse(flashlist.color));
      ref.read(editModeControllerProvider).toggleEditMode(flashlist);
    }

    void deleteFlashlist() async {
      final wantsToDelete = await showConfirmDialog(
        context: context,
        title: '${localizationsOf(context).delete} ${flashlist.title}?',
        content: localizationsOf(context).thisCannotBeUndone,
        confirmAction: Icons.delete,
        cancelAction: Icons.cancel,
      );

      if (wantsToDelete == true) {
        ref.read(flashlistControllerProvider).deleteFlashlist(flashlist.id!);
      }
    }

    void leaveFlashlist() async {
      final wantsToLeave = await showConfirmDialog(
        context: context,
        title: '${localizationsOf(context).leaveList} ${flashlist.title}?',
        content: localizationsOf(context).youHaveToBeReinvited,
        confirmAction: Icons.delete,
        cancelAction: Icons.cancel,
      );

      if (wantsToLeave == true) {
        ref.read(flashlistControllerProvider).removeUserFromFlashlist(
              RemoveUserFromFlashlist(
                userId: ref.read(sessionManagerProvider).signedInUser!.id!,
                flashlistId: flashlist.id!,
              ),
            );
      }
    }

    bool isAuthenticatedUserOwner =
        ref.watch(userAccessLevelForFlashlistProvider(flashlist.id!)).value ==
            'owner';

    return SizedBox(
      width: Sizes.p42,
      child: PopupMenuButton(
        itemBuilder: (BuildContext context) {
          if (isAuthenticatedUserOwner) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                onTap: launchEditModeForFlashlist,
                child: Text(localizationsOf(context).edit),
              ),
              PopupMenuItem(
                onTap: () {
                  showModalBottomSheet(
                    // isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.p4),
                        topRight: Radius.circular(Sizes.p4),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return ShareModal(flashlist);
                    },
                  );
                },
                child: Text(localizationsOf(context).share),
              ),
              PopupMenuItem(
                onTap: deleteFlashlist,
                child: Text(
                  localizationsOf(context).delete,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ];
          } else {
            return <PopupMenuEntry>[
              PopupMenuItem(
                onTap: leaveFlashlist,
                child: Text(localizationsOf(context).leaveList),
              ),
            ];
          }
        },
      ),
    );
  }
}
