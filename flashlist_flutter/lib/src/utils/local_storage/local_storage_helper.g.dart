// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_helper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localStorageHelperHash() =>
    r'48758c3d36a3545c19290bf6c1a38b9881af6256';

/// State Notifier class for the local storage
/// Holds [recentColors] = List of 8 colors that the user has recently used
/// Soon: Holds [listCollapseStates] = Map of list id and its collapse state
///
/// Copied from [LocalStorageHelper].
@ProviderFor(LocalStorageHelper)
final localStorageHelperProvider =
    AutoDisposeNotifierProvider<LocalStorageHelper, LocalStorageState>.internal(
  LocalStorageHelper.new,
  name: r'localStorageHelperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localStorageHelperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalStorageHelper = AutoDisposeNotifier<LocalStorageState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
