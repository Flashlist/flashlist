import 'package:flashlist_flutter/src/features/color_picker/presentation/advanced_color.dart/advanced_color.dart';
import 'package:flashlist_flutter/src/features/color_picker/presentation/color_slider.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/presentation/edit_mode_controls.dart';
import 'package:flashlist_flutter/src/shared/sliding_panel/presentation/sliding_panel.dart';
import 'package:flashlist_flutter/src/shared/sliding_panel/presentation/sliding_panel_animator.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditModeOverlay extends ConsumerWidget {
  /// EditModeOverlay is a widget that wraps the [child] with the edit mode
  /// overlay. It provides the edit mode button, the advanced color picker
  /// button, and the color slider.
  const EditModeOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editMode = ref.watch(editModePanelControllerProvider);
    final editModeController =
        ref.watch(editModePanelControllerProvider.notifier);

    return SafeArea(
      child: Stack(
        children: [
          child,
          // Toggle Edit Mode Button
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            right: 0,
            bottom: SlidingPanel.panelHeight +
                SlidingPanel.paddingWidth +
                (editMode.isAdvancedColorExpanded
                    ? SlidingPanel.panelHeight * 2 +
                        (5 * SlidingPanel.paddingWidth)
                    : 0) +
                SlidingPanel.paddingWidth,
            child: SlidingPanelAnimator(
              isOpen: editMode.isEditMode,
              withBackground: false,
              direction: SlideDirection.rightToLeft,
              child: const EditModeControls(),
            ),
          ),
          // Advanced Color Picker
          Positioned(
            bottom: 2 * SlidingPanel.paddingWidth + SlidingPanel.panelHeight,
            left: SlidingPanel.paddingWidth,
            right: SlidingPanel.paddingWidth,
            child: AnimatedContainer(
              transform: Matrix4.translationValues(
                0,
                editMode.isAdvancedColorExpanded ? 0 : 200,
                0,
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              duration: const Duration(milliseconds: 200),
              height: 100,
              child: const AdvancedColor(),
            ),
          ),
          // Bottom Row
          // Advanced Color Picker Button
          Positioned(
            bottom: 6,
            left: 0,
            width: SlidingPanel.leftPanelFixedWidth,
            child: SlidingPanelAnimator(
              isOpen: editMode.isEditMode,
              direction: SlideDirection.leftToRight,
              child: IconButton(
                icon: editMode.isAdvancedColorExpanded
                    ? const Icon(Icons.close)
                    : const Icon(Icons.color_lens),
                onPressed: () {
                  editModeController.toggleAdvancedColor();
                },
              ),
            ),
          ),
          // Color Slider
          Positioned(
            bottom: SlidingPanel.paddingWidth,
            right: 0,
            width: mediaQueryOf(context).size.width -
                SlidingPanel.leftPanelFixedWidth,
            child: SlidingPanelAnimator(
              isOpen: editMode.isEditMode,
              direction: SlideDirection.rightToLeft,
              child: const ColorSlider(ColorPickerValue.hue),
            ),
          ),
        ],
      ),
    );
  }
}
