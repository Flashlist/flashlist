// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticationControllerHash() =>
    r'e54b8b577339ed106f71ff2ca6690b33119ea3fb';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthenticationControllerRef
    = AutoDisposeProviderRef<AuthenticationController>;
String _$isAuthenticatedHash() => r'e406aafe8f6d5ee5a26cc415c60fd4fa539ec6d8';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAuthenticatedRef = AutoDisposeStreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
