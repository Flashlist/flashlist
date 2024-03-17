// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userControllerHash() => r'c223e79ac52d06ff6f2077678e394a8933dd7768';

/// See also [userController].
@ProviderFor(userController)
final userControllerProvider = AutoDisposeProvider<UserController>.internal(
  userController,
  name: r'userControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserControllerRef = AutoDisposeProviderRef<UserController>;
String _$currentUserHash() => r'bac7f4e911f0d8fc08783f830fdd7b8dd190a232';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<AppUser?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeFutureProviderRef<AppUser?>;
String _$connectionsHash() => r'99c248a0741a9018ebfbb03ccc69651ecae3c334';

/// See also [connections].
@ProviderFor(connections)
final connectionsProvider = AutoDisposeFutureProvider<List<AppUser?>>.internal(
  connections,
  name: r'connectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$connectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectionsRef = AutoDisposeFutureProviderRef<List<AppUser?>>;
String _$pendingRequestsHash() => r'cea332daf44ce8fcea811430108bc7d5ebb9adb5';

/// See also [pendingRequests].
@ProviderFor(pendingRequests)
final pendingRequestsProvider =
    AutoDisposeFutureProvider<List<UserRequest?>>.internal(
  pendingRequests,
  name: r'pendingRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PendingRequestsRef = AutoDisposeFutureProviderRef<List<UserRequest?>>;
String _$userByIdHash() => r'f2f634bb62b227c4331275c4f5f9adaed16777dc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userById].
@ProviderFor(userById)
const userByIdProvider = UserByIdFamily();

/// See also [userById].
class UserByIdFamily extends Family<AsyncValue<AppUser?>> {
  /// See also [userById].
  const UserByIdFamily();

  /// See also [userById].
  UserByIdProvider call(
    int id,
  ) {
    return UserByIdProvider(
      id,
    );
  }

  @override
  UserByIdProvider getProviderOverride(
    covariant UserByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userByIdProvider';
}

/// See also [userById].
class UserByIdProvider extends AutoDisposeFutureProvider<AppUser?> {
  /// See also [userById].
  UserByIdProvider(
    int id,
  ) : this._internal(
          (ref) => userById(
            ref as UserByIdRef,
            id,
          ),
          from: userByIdProvider,
          name: r'userByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByIdHash,
          dependencies: UserByIdFamily._dependencies,
          allTransitiveDependencies: UserByIdFamily._allTransitiveDependencies,
          id: id,
        );

  UserByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<AppUser?> Function(UserByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByIdProvider._internal(
        (ref) => create(ref as UserByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AppUser?> createElement() {
    return _UserByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserByIdRef on AutoDisposeFutureProviderRef<AppUser?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _UserByIdProviderElement
    extends AutoDisposeFutureProviderElement<AppUser?> with UserByIdRef {
  _UserByIdProviderElement(super.provider);

  @override
  int get id => (origin as UserByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
