// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pc_overflow_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pCOverflowVisibleStateHash() =>
    r'd8ad74aba1ca54464523f159baddae827a85c23e';

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

abstract class _$PCOverflowVisibleState
    extends BuildlessAutoDisposeNotifier<bool> {
  late final Key? key;

  bool build({
    Key? key,
  });
}

/// See also [PCOverflowVisibleState].
@ProviderFor(PCOverflowVisibleState)
const pCOverflowVisibleStateProvider = PCOverflowVisibleStateFamily();

/// See also [PCOverflowVisibleState].
class PCOverflowVisibleStateFamily extends Family<bool> {
  /// See also [PCOverflowVisibleState].
  const PCOverflowVisibleStateFamily();

  /// See also [PCOverflowVisibleState].
  PCOverflowVisibleStateProvider call({
    Key? key,
  }) {
    return PCOverflowVisibleStateProvider(
      key: key,
    );
  }

  @override
  PCOverflowVisibleStateProvider getProviderOverride(
    covariant PCOverflowVisibleStateProvider provider,
  ) {
    return call(
      key: provider.key,
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
  String? get name => r'pCOverflowVisibleStateProvider';
}

/// See also [PCOverflowVisibleState].
class PCOverflowVisibleStateProvider
    extends AutoDisposeNotifierProviderImpl<PCOverflowVisibleState, bool> {
  /// See also [PCOverflowVisibleState].
  PCOverflowVisibleStateProvider({
    this.key,
  }) : super.internal(
          () => PCOverflowVisibleState()..key = key,
          from: pCOverflowVisibleStateProvider,
          name: r'pCOverflowVisibleStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pCOverflowVisibleStateHash,
          dependencies: PCOverflowVisibleStateFamily._dependencies,
          allTransitiveDependencies:
              PCOverflowVisibleStateFamily._allTransitiveDependencies,
        );

  final Key? key;

  @override
  bool operator ==(Object other) {
    return other is PCOverflowVisibleStateProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  bool runNotifierBuild(
    covariant PCOverflowVisibleState notifier,
  ) {
    return notifier.build(
      key: key,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
