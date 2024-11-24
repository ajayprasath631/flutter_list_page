import 'package:flutter_list_page/features/author/application/author_usecase.dart';
import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_list_page/features/author/domain/repository/author_repository.dart';
import 'package:network/either_export.dart';

class AuthorLogic implements AuthorUseCase {
  final AuthorRepository repository;
  AuthorLogic({
    required this.repository,
  });

  @override
  Future<Either<ServerException, AuthorList>> fetchAuthorList({
    String? pageToken,
    int? limit,
  }) async {
    final authorResponse = await repository.fetchAuthorList(
      pageToken: pageToken,
      limit: limit,
    );
    return authorResponse;
  }
}
