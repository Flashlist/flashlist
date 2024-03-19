// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_picker_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$colorPickerControllerHash() =>
    r'c46d32cd436c6e340470b1b09eb3f146543bfe3d';

/// State Notifier class for the color picker
///
/// Allows to manipulate the color picker state through,
///
/// [changeAlpha], [changeHue], [changeSaturation], [changeVValue], [takeHex]
///
/// It can be called from anywhere in the app and will update the state
///
/// Copied from [ColorPickerController].
@ProviderFor(ColorPickerController)
final colorPickerControllerProvider = AutoDisposeNotifierProvider<
    ColorPickerController, ColorPickerState>.internal(
  ColorPickerController.new,
  name: r'colorPickerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$colorPickerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ColorPickerController = AutoDisposeNotifier<ColorPickerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
