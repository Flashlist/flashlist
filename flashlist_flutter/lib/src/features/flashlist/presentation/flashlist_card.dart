import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashlistCard extends ConsumerWidget {
  const FlashlistCard({super.key, required this.flashlist});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editModeController = ref.watch(editModeControllerProvider.notifier);

    final cardColor = ref.watch(cardColorProvider(flashlist));

    return AnimatedContainer(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: cardColor,
        ),
        borderRadius: BorderRadius.circular(4),
        color: cardColor.withOpacity(0.2),
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
                Text(flashlist.title),
                IconButton(
                  onPressed: () {
                    ref
                        .read(colorPickerControllerProvider.notifier)
                        .takeInt(int.parse(flashlist.color));
                    editModeController.toggleEditMode(flashlist.id!);
                  },
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
