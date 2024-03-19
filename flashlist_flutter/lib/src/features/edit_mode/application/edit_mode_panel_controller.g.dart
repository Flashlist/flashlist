// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_mode_panel_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editModePanelControllerHash() =>
    r'0475df0b06cd3db25071a01270310df011a07a77';

/// State Notifier class for the EditModePanel
/// Allows to manipulate the EditModePanel state through,
/// [toggleEditMode],  [toggleAdvancedColor]
/// It can be called from anywhere in the app and will update the state
/// Holds the ID of the flashlist in edit mode
///
/// Copied from [EditModePanelController].
@ProviderFor(EditModePanelController)
final editModePanelControllerProvider = AutoDisposeNotifierProvider<
    EditModePanelController, EditModePanelState>.internal(
  EditModePanelController.new,
  name: r'editModePanelControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editModePanelControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditModePanelController = AutoDisposeNotifier<EditModePanelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
