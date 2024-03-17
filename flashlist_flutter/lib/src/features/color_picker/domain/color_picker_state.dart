import 'package:flashlist_flutter/src/features/color_picker/utils/hex_parser.dart';
import 'package:flutter/material.dart';

/// State class holding every value that can be manipulated within the color picker
/// [alpha] is the opacity of the color
///
/// [hue] is the color itself
///
/// [saturation] is the intensity of the color
///
/// [vValue] is the brightness of the color
///
/// [color] is the parsed HSVColor from the values above
///
/// [colorHexValue] is the hexadecimal value of the color
///
/// [colorHexReadableString] is the hexadecimal value in a readable format
///
class ColorPickerState {
  const ColorPickerState({
    this.alpha = 1.0,
    this.hue = 0.0,
    this.saturation = 1.0,
    this.vValue = 1.0,
    this.color = const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0),
    this.colorHexValue = '#ffff0000',
    this.colorHexReadableString = '#ff0000',
  });

  final double alpha;
  final double hue;
  final double saturation;
  final double vValue;
  final HSVColor color;
  final String colorHexValue;
  final String colorHexReadableString;

  ColorPickerState copyWith({
    double? alpha,
    double? hue,
    double? saturation,
    double? vValue,
    HSVColor? color,
    String? colorHexValue,
    String? colorHexReadableString,
  }) {
    return ColorPickerState(
      alpha: alpha ?? this.alpha,
      hue: hue ?? this.hue,
      saturation: saturation ?? this.saturation,
      vValue: vValue ?? this.vValue,
      color: HSVColor.fromAHSV(
        this.alpha,
        this.hue,
        this.saturation,
        this.vValue,
      ),
      colorHexValue: parseIntoHexString(
        this.color.toColor(),
      ),
      colorHexReadableString: parseIntoReadableHexString(
        this.color.toColor(),
      ),
    );
  }
}
