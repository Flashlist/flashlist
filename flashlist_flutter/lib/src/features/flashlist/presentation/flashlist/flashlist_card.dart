import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist/flashlist_card_header/flashlist_card_header.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_body.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_item_input.dart';

/// A widget to display a single flashlist
/// Includes a [TextField] to add new items to the flashlist
/// [isAdding] is a bool passed to represent if the TextField is visible
/// Only one TextField should be visible at a time.
class FlashlistCard extends HookConsumerWidget {
  const FlashlistCard({
    super.key,
    required this.flashlist,
    required this.isAdding,
    required this.toggleIsAdding,
  });

  final Flashlist flashlist;
  final bool isAdding;
  final Function() toggleIsAdding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the editModePanelState
    final editModePanel = ref.watch(editModePanelControllerProvider);

    // Get the colorPickerState
    final colorPicker = ref.watch(colorPickerControllerProvider);

    // Get the color of the flashlist
    // If the flashlist is in edit mode, use the color from the colorPicker
    // Otherwise, use the color from the flashlist
    final flashlistColor = editModePanel.flashlistInEditMode == flashlist.id
        ? colorPicker.color.toColor()
        : Color(int.parse(flashlist.color));

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          AnimatedContainer(
            width: double.infinity,
            margin: const EdgeInsets.all(Sizes.p8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: flashlistColor,
            ),
            duration: Duration.zero,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  gapH8,
                  FlashlistCardHeader(flashlist: flashlist),
                  gapH12,
                  FlashlistBody(flashlist: flashlist),
                  gapH12,
                  IconButton(
                    color: Colors.white,
                    onPressed: toggleIsAdding,
                    icon: isAdding
                        ? const Icon(Icons.remove_circle_outline)
                        : const Icon(Icons.add_circle_outline),
                  ),
                  gapH8,
                ],
              ),
            ),
          ),
          // Only visible when isAdding is true
          FlashlistItemInput(flashlist: flashlist, isAdding: isAdding),
        ],
      ),
    );
  }
}
