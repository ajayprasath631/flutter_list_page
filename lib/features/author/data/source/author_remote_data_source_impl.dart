import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_list_page/features/author/domain/source/author_remote_data_source.dart';
import 'package:flutter_list_page/utility/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:network/either_export.dart';
import 'package:network/provider/api_service.dart';

class AuthorRemoteDataSourceImpl implements AuthorRemoteDataSource {
  final ApiService apiService;

  AuthorRemoteDataSourceImpl({
    required this.apiService,
  });
  @override
  Future<Either<ServerException, AuthorList>> fetchAuthorList({
    String? pageToken,
    int? limit,
  }) async {
    try {
      final String url;
      if (pageToken == null || limit == null) {
        url = "${EnvConfig.baseUrl}messages";
      } else {
        url = "${EnvConfig.baseUrl}messages?pageToken=$pageToken";
      }
      final Response? response = await apiService.get(url);
      final AuthorList authorResponse = AuthorList.fromJson(response?.data);
      return Right(authorResponse);
    } on DioException catch (e) {
      return Left(ServerException(e));
    } catch (e) {
      return Left(ServerException(e));
    }
  }
}
