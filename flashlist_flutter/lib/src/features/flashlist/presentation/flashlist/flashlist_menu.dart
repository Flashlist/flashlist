import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/share/share_modal.dart';
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

    void deleteFlashlist() {
      ref.read(flashlistControllerProvider).deleteFlashlist(flashlist.id!);
    }

    // bool isAuthenticatedUserOwner =
    //     ref.watch(userFlashlistPermissionProvider(flashlist.id!)).value ==
    //         'owner';

    int userId = ref.read(sessionManagerProvider).signedInUser!.id!;

    return SizedBox(
        width: Sizes.p42,
        child: PopupMenuButton(itemBuilder: (BuildContext context) {
          if (true) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                onTap: launchEditModeForFlashlist,
                child: const Text('Edit'),
              ),
              PopupMenuItem(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
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
                child: const Text('Share'),
              ),
              PopupMenuItem(
                onTap: deleteFlashlist,
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ];
          } else {
            return <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () {
                  // ref.read(flashlistControllerProvider).removeUserFromFlashlist(
                  //       FlashlistRemoveUser(
                  //         userId: userId,
                  //         listId: flashlist.id!,
                  //       ),
                  //     );
                },
                child: const Text('Leave List'),
              ),
            ];
          }
        }));
  }
}
