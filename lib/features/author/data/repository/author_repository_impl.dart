import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_list_page/features/author/domain/repository/author_repository.dart';
import 'package:flutter_list_page/features/author/domain/source/author_remote_data_source.dart';
import 'package:network/either_export.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  final AuthorRemoteDataSource remoteDataSource;

  AuthorRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<ServerException, AuthorList>> fetchAuthorList({
    String? pageToken,
    int? limit,
  }) async {
    final authorResponse = await remoteDataSource.fetchAuthorList(
      pageToken: pageToken,
      limit: limit,
    );
    return authorResponse;
  }
}
