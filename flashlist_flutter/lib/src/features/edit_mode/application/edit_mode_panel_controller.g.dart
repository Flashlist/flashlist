// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_mode_panel_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editModePanelControllerHash() =>
    r'9dfb6bf284e9d40903bd68c1928d273dd4992862';

/// State Notifier class for the EditModePanel
/// EditModePanel utilizes lib/src/shared/sliding_panel to build EditModeOverlay
/// Allows to manipulate the EditModePanel state through,
/// [togglePanel],  [toggleAdvancedColor]
/// It can be called from anywhere in the app and will update the state
/// Holds the ID of the flashlist in edit mode if no flashlist is in edit mode it will be 0
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
