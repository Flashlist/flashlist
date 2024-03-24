// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashlist_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashlistControllerHash() =>
    r'6fd9be1ef7b7c6365b631f02c1488bc048292e9e';

/// See also [flashlistController].
@ProviderFor(flashlistController)
final flashlistControllerProvider =
    AutoDisposeProvider<FlashlistController>.internal(
  flashlistController,
  name: r'flashlistControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashlistControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlashlistControllerRef = AutoDisposeProviderRef<FlashlistController>;
String _$flashlistByIdHash() => r'48934ea51b1a21934d934b20c61b0fc9cceb2724';

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

/// See also [flashlistById].
@ProviderFor(flashlistById)
const flashlistByIdProvider = FlashlistByIdFamily();

/// See also [flashlistById].
class FlashlistByIdFamily extends Family<AsyncValue<Flashlist?>> {
  /// See also [flashlistById].
  const FlashlistByIdFamily();

  /// See also [flashlistById].
  FlashlistByIdProvider call(
    int flashlistId,
  ) {
    return FlashlistByIdProvider(
      flashlistId,
    );
  }

  @override
  FlashlistByIdProvider getProviderOverride(
    covariant FlashlistByIdProvider provider,
  ) {
    return call(
      provider.flashlistId,
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
  String? get name => r'flashlistByIdProvider';
}

/// See also [flashlistById].
class FlashlistByIdProvider extends AutoDisposeFutureProvider<Flashlist?> {
  /// See also [flashlistById].
  FlashlistByIdProvider(
    int flashlistId,
  ) : this._internal(
          (ref) => flashlistById(
            ref as FlashlistByIdRef,
            flashlistId,
          ),
          from: flashlistByIdProvider,
          name: r'flashlistByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flashlistByIdHash,
          dependencies: FlashlistByIdFamily._dependencies,
          allTransitiveDependencies:
              FlashlistByIdFamily._allTransitiveDependencies,
          flashlistId: flashlistId,
        );

  FlashlistByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.flashlistId,
  }) : super.internal();

  final int flashlistId;

  @override
  Override overrideWith(
    FutureOr<Flashlist?> Function(FlashlistByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlashlistByIdProvider._internal(
        (ref) => create(ref as FlashlistByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        flashlistId: flashlistId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Flashlist?> createElement() {
    return _FlashlistByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlashlistByIdProvider && other.flashlistId == flashlistId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, flashlistId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FlashlistByIdRef on AutoDisposeFutureProviderRef<Flashlist?> {
  /// The parameter `flashlistId` of this provider.
  int get flashlistId;
}

class _FlashlistByIdProviderElement
    extends AutoDisposeFutureProviderElement<Flashlist?> with FlashlistByIdRef {
  _FlashlistByIdProviderElement(super.provider);

  @override
  int get flashlistId => (origin as FlashlistByIdProvider).flashlistId;
}

String _$flashlistsForUserHash() => r'f23c4ff104af17434fa8285ccabbc474e0079248';

/// See also [flashlistsForUser].
@ProviderFor(flashlistsForUser)
final flashlistsForUserProvider =
    AutoDisposeStreamProvider<List<Flashlist?>>.internal(
  flashlistsForUser,
  name: r'flashlistsForUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashlistsForUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlashlistsForUserRef = AutoDisposeStreamProviderRef<List<Flashlist?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
