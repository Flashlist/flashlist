import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// HexInput is a widget that allows the user to input a hex value
/// The hex value is then parsed and the color is updated
/// It uses the [ColorPickerController] to update the color
class HexInput extends ConsumerWidget {
  const HexInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorPicker = ref.watch(colorPickerControllerProvider);
    final colorPickerController =
        ref.watch(colorPickerControllerProvider.notifier);

    final hexInputController = TextEditingController();

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: hexInputController,
              onSubmitted: (value) {
                colorPickerController.takeHex(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                labelText:
                    '#${colorPicker.color.toColor().value.toRadixString(16).substring(2)}',
              ),
            ),
          ),
          gapW4,
          Container(
            width: Sizes.p42,
            decoration: BoxDecoration(
              border: Border.all(
                color: colorSchemeOf(context).onBackground,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.numbers),
              onPressed: () {
                // TODO - Fix this bug
                colorPickerController.takeHex(hexInputController.text);
                colorPickerController.takeHex(hexInputController.text);
                ref
                    .read(editModePanelControllerProvider.notifier)
                    .toggleAdvancedColor();
                hexInputController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
