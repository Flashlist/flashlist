import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';

enum ColorPickerValue {
  alpha,
  hue,
  saturation,
}

class ColorSlider extends HookConsumerWidget {
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

    final isChanging = useState(false);

    void changeValue(newValue) =>
        ref.read(colorPickerControllerProvider.notifier).changeHue(newValue);

    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isChanging.value ? 1.0 : 0.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                colors: [
                  for (var h = 0.0; h < 360.0; h += 1)
                    HSVColor.fromAHSV(1.0, h, 1.0, 1.0).toColor()
                ],
              ),
            ),
          ),
        ),
        Slider.adaptive(
          onChangeStart: (value) => isChanging.value = true,
          onChangeEnd: (value) => isChanging.value = false,
          value: state.hue,
          min: 0,
          max: parameter == ColorPickerValue.hue ? 360 : 1.0,
          onChanged: (newValue) => changeValue(newValue),
        ),
      ],
    );
  }
}
