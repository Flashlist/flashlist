// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticationControllerHash() =>
    r'4a29f5be4dc9ec9c4e4f58e8419ff912484dfca5';

/// Provider for the [AuthenticationController].
///
/// Copied from [authenticationController].
@ProviderFor(authenticationController)
final authenticationControllerProvider =
    AutoDisposeProvider<AuthenticationController>.internal(
  authenticationController,
  name: r'authenticationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationControllerRef
    = AutoDisposeProviderRef<AuthenticationController>;
String _$isAuthenticatedHash() => r'32d1f7ea4d2f6b33df48477e2316c94fc73cc456';

/// Provider for the authentication-state
/// returns a [bool] corresponding with the current authentication state.
///
/// Copied from [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeStreamProvider<bool>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAuthenticatedRef = AutoDisposeStreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
