// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_provider_container.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteDataSourceRepoHash() =>
    r'4b942d82d41b4f3d6632a7fa8170c9c2f8e913d1';

/// See also [remoteDataSourceRepo].
@ProviderFor(remoteDataSourceRepo)
final remoteDataSourceRepoProvider =
    AutoDisposeProvider<AuthorRemoteDataSource>.internal(
  remoteDataSourceRepo,
  name: r'remoteDataSourceRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteDataSourceRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemoteDataSourceRepoRef
    = AutoDisposeProviderRef<AuthorRemoteDataSource>;
String _$authorRepositoryHash() => r'f3519aa546212c8622feb70876793bebd4966090';

/// See also [authorRepository].
@ProviderFor(authorRepository)
final authorRepositoryProvider = AutoDisposeProvider<AuthorRepository>.internal(
  authorRepository,
  name: r'authorRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authorRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthorRepositoryRef = AutoDisposeProviderRef<AuthorRepository>;
String _$authorUseCaseHash() => r'4361d47af49c54892188a7570f198998518b1f0c';

/// See also [authorUseCase].
@ProviderFor(authorUseCase)
final authorUseCaseProvider = AutoDisposeProvider<AuthorLogic>.internal(
  authorUseCase,
  name: r'authorUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authorUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthorUseCaseRef = AutoDisposeProviderRef<AuthorLogic>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
