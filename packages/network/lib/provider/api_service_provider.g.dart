// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServiceDioHash() => r'b11a0aea9090846bfb9820622c4973956b6d4c81';

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

/// See also [apiServiceDio].
@ProviderFor(apiServiceDio)
const apiServiceDioProvider = ApiServiceDioFamily();

/// See also [apiServiceDio].
class ApiServiceDioFamily extends Family<ApiService> {
  /// See also [apiServiceDio].
  const ApiServiceDioFamily();

  /// See also [apiServiceDio].
  ApiServiceDioProvider call({
    required String baseUrl,
  }) {
    return ApiServiceDioProvider(
      baseUrl: baseUrl,
    );
  }

  @override
  ApiServiceDioProvider getProviderOverride(
    covariant ApiServiceDioProvider provider,
  ) {
    return call(
      baseUrl: provider.baseUrl,
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
  String? get name => r'apiServiceDioProvider';
}

/// See also [apiServiceDio].
class ApiServiceDioProvider extends AutoDisposeProvider<ApiService> {
  /// See also [apiServiceDio].
  ApiServiceDioProvider({
    required String baseUrl,
  }) : this._internal(
          (ref) => apiServiceDio(
            ref as ApiServiceDioRef,
            baseUrl: baseUrl,
          ),
          from: apiServiceDioProvider,
          name: r'apiServiceDioProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiServiceDioHash,
          dependencies: ApiServiceDioFamily._dependencies,
          allTransitiveDependencies:
              ApiServiceDioFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  ApiServiceDioProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.baseUrl,
  }) : super.internal();

  final String baseUrl;

  @override
  Override overrideWith(
    ApiService Function(ApiServiceDioRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiServiceDioProvider._internal(
        (ref) => create(ref as ApiServiceDioRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        baseUrl: baseUrl,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ApiService> createElement() {
    return _ApiServiceDioProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiServiceDioProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApiServiceDioRef on AutoDisposeProviderRef<ApiService> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _ApiServiceDioProviderElement
    extends AutoDisposeProviderElement<ApiService> with ApiServiceDioRef {
  _ApiServiceDioProviderElement(super.provider);

  @override
  String get baseUrl => (origin as ApiServiceDioProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
