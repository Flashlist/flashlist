import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ColorPickerValue {
  alpha,
  hue,
  saturation,
}

class ColorSlider extends ConsumerWidget {
  /// Slider widget for the color picker
  /// It uses the [ColorPickerController] to update the color
  /// The [parameter] is the value that will be updated
  /// It can be called from anywhere in the app and will update the state
  const ColorSlider(
    this.parameter, {
    super.key,
  });

  final ColorPickerValue parameter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorPickerControllerProvider);

    void changeValue(newValue) =>
        ref.read(colorPickerControllerProvider.notifier).changeHue(newValue);

    return Slider.adaptive(
      value: state.hue,
      min: 0,
      max: parameter == ColorPickerValue.hue ? 360 : 1.0,
      onChanged: (newValue) => changeValue(newValue),
    );
  }
}
