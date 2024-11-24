// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:network/provider/api_service.dart';
import 'package:network/utility/dio_client.dart';

part 'api_service_provider.g.dart';

@riverpod
ApiService apiServiceDio(
  Ref ref, {
  required String baseUrl,
}) {
  return ApiService(
    DioClient.getDio(baseUrl: baseUrl),
  );
}
