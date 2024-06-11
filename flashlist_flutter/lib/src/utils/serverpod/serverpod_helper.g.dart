// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serverpod_helper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientHash() => r'32f81e59869efbfcffb43d8b68163bad5081b6c0';

/// See also [client].
@ProviderFor(client)
final clientProvider = AutoDisposeProvider<Client>.internal(
  client,
  name: r'clientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientRef = AutoDisposeProviderRef<Client>;
String _$sessionManagerHash() => r'a6916a0eb10ebace387384bde767f8aaed54225d';

/// See also [sessionManager].
@ProviderFor(sessionManager)
final sessionManagerProvider = AutoDisposeProvider<SessionManager>.internal(
  sessionManager,
  name: r'sessionManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionManagerRef = AutoDisposeProviderRef<SessionManager>;
String _$serverpodHelperHash() => r'ee86ab5189542c09d60b9269c8cfc5717079e3d8';

/// Provider for the serverpodHelper class
/// Automatically caches and disposes the helper when no longer used.
///
/// Copied from [serverpodHelper].
@ProviderFor(serverpodHelper)
final serverpodHelperProvider = AutoDisposeProvider<ServerpodHelper>.internal(
  serverpodHelper,
  name: r'serverpodHelperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serverpodHelperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ServerpodHelperRef = AutoDisposeProviderRef<ServerpodHelper>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
