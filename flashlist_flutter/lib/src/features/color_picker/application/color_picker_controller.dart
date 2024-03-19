import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_flutter/src/features/color_picker/domain/color_picker_state.dart';

part 'color_picker_controller.g.dart';

@riverpod

/// State Notifier class for the color picker
///
/// Allows to manipulate the color picker state through,
///
/// [changeAlpha], [changeHue], [changeSaturation], [changeVValue], [takeHex]
///
/// It can be called from anywhere in the app and will update the state
class ColorPickerController extends _$ColorPickerController {
  @override
  ColorPickerState build() {
    return const ColorPickerState(hue: 0.0);
  }

  // Alpha = Opacity
  void changeAlpha(double value) {
    state = state.copyWith(
      alpha: value,
    );
  }

  void changeHue(double value) {
    state = state.copyWith(
      hue: value,
    );
  }

  void changeSaturation(double value) {
    state = state.copyWith(
      saturation: value,
    );
  }

  void changeVValue(double value) {
    state = state.copyWith(
      vValue: value,
    );
  }

  void takeInt(int value) {
    final color = Color(value);
    final hsvColor = HSVColor.fromColor(color);
    state = state.copyWith(
      hue: hsvColor.hue,
      saturation: hsvColor.saturation,
      vValue: hsvColor.value,
      color: hsvColor,
      colorHexValue: color.value.toRadixString(16).substring(2),
    );
  }

  void takeHex(String hex) async {
    final hexValue = hex.startsWith('#') ? hex.substring(1) : hex;

    final hsvColor = HSVColor.fromColor(
      Color(int.parse('0xFF$hexValue')),
    );

    state = state.copyWith(
      hue: hsvColor.hue,
      saturation: hsvColor.saturation,
      vValue: hsvColor.value,
      color: hsvColor,
      colorHexValue: hexValue,
    );
  }
}
