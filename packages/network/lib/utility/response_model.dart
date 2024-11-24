// Project imports:
import 'package:network/utility/either.dart';
import 'package:network/utility/server_errors.dart';

class ResponseNetworkModel {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  ResponseNetworkModel({
    required this.statusCode,
    this.statusMessage,
    this.data = const {},
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data';
  }
}

extension ResponseExtension on ResponseNetworkModel {
  Right<ServerException, ResponseNetworkModel> get toRight => Right(this);
}
