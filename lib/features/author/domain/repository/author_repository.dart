import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:network/either_export.dart';

abstract class AuthorRepository {
  Future<Either<ServerException, AuthorList>> fetchAuthorList({
    String? pageToken,
    int? limit,
  });
}
