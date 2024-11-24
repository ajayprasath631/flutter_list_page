import 'package:flutter_list_page/features/author/application/author_logic.dart';
import 'package:flutter_list_page/features/author/data/repository/author_repository_impl.dart';
import 'package:flutter_list_page/features/author/data/source/author_remote_data_source_impl.dart';
import 'package:flutter_list_page/features/author/domain/repository/author_repository.dart';
import 'package:flutter_list_page/features/author/domain/source/author_remote_data_source.dart';
import 'package:flutter_list_page/utility/flavor_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:network/provider/api_service_provider.dart';

part 'author_provider_container.g.dart';

// Remote Data Source Provider with API Instance
@riverpod
AuthorRemoteDataSource remoteDataSourceRepo(Ref ref) {
  final apiService = ref.read(
    apiServiceDioProvider(
      baseUrl: EnvConfig.baseUrl,
    ),
  );

  return AuthorRemoteDataSourceImpl(
    apiService: apiService,
  );
}

//  Repository provider with local & remote data source
@riverpod
AuthorRepository authorRepository(Ref ref) {
  final remoteService = ref.read(
    remoteDataSourceRepoProvider,
  );
  return AuthorRepositoryImpl(
    remoteDataSource: remoteService,
  );
}

@riverpod
AuthorLogic authorUseCase(Ref ref) {
  final welcomeRepository = ref.read(
    authorRepositoryProvider,
  );
  return AuthorLogic(
    repository: welcomeRepository,
  );
}
