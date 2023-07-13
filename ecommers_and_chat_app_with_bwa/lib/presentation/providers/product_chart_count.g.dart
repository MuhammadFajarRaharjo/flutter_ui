// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_chart_count.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productChartCountHash() => r'249d5721962bae8f0607b6354dfe9984f62336eb';

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

abstract class _$ProductChartCount extends BuildlessAutoDisposeNotifier<int> {
  late final Key? key;

  int build(
    Key? key,
  );
}

/// See also [ProductChartCount].
@ProviderFor(ProductChartCount)
const productChartCountProvider = ProductChartCountFamily();

/// See also [ProductChartCount].
class ProductChartCountFamily extends Family<int> {
  /// See also [ProductChartCount].
  const ProductChartCountFamily();

  /// See also [ProductChartCount].
  ProductChartCountProvider call(
    Key? key,
  ) {
    return ProductChartCountProvider(
      key,
    );
  }

  @override
  ProductChartCountProvider getProviderOverride(
    covariant ProductChartCountProvider provider,
  ) {
    return call(
      provider.key,
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
  String? get name => r'productChartCountProvider';
}

/// See also [ProductChartCount].
class ProductChartCountProvider
    extends AutoDisposeNotifierProviderImpl<ProductChartCount, int> {
  /// See also [ProductChartCount].
  ProductChartCountProvider(
    this.key,
  ) : super.internal(
          () => ProductChartCount()..key = key,
          from: productChartCountProvider,
          name: r'productChartCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productChartCountHash,
          dependencies: ProductChartCountFamily._dependencies,
          allTransitiveDependencies:
              ProductChartCountFamily._allTransitiveDependencies,
        );

  final Key? key;

  @override
  bool operator ==(Object other) {
    return other is ProductChartCountProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  int runNotifierBuild(
    covariant ProductChartCount notifier,
  ) {
    return notifier.build(
      key,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
