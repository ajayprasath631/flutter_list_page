// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:network/interceptors/logger_interceptor.dart';

class DioClient {
  static Dio getDio({
    required String baseUrl,
    List<Interceptor>? interceptors,
    Map<String, dynamic>? headers,
  }) {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl = baseUrl,
        headers: headers = {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
      )
      ..interceptors.addAll([LoggerInterceptor()]);

    return dio;
  }
}
