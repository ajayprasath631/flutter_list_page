// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:network/utility/either.dart';

// Project imports:

enum ServerExceptionType {
  requestCancelled,

  badCertificate,

  unauthorisedRequest,

  connectionError,

  badRequest,

  notFound,

  requestTimeout,

  sendTimeout,

  receiveTimeout,

  conflict,

  internalServerError,

  notImplemented,

  serviceUnavailable,

  socketException,

  formatException,

  unableToProcess,

  defaultError,

  unexpectedError,
}

extension ServerExceptionExtension on ServerException {
  Left<ServerException, Response> get toLeft =>
      Left<ServerException, Response>(this);
}

class ServerException implements Exception {
  final String name;
  final String message;
  final int? statusCode;
  final ServerExceptionType exceptionType;
  final dynamic responseData;

  String getDisplayMessage() {
    if (statusCode == 400) {
      return 'Try Later';
    } else if (statusCode == 401) {
      return 'User is not ';
    } else if (statusCode == 403) {
      return 'User is not authorized';
    } else if (statusCode == 404) {
      return 'Request does not exist';
    } else if (statusCode == 405) {
      return 'Operation not allowed';
    } else if (statusCode == 415) {
      return 'Media type unsupported';
    } else if (statusCode == 422) {
      return 'validation data failure';
    } else if (statusCode == 429) {
      return 'too much requests';
    } else if (statusCode == 500) {
      return 'Internal server error';
    } else if (statusCode == 503) {
      return 'Service unavailable';
    } else {
      return 'Server Error';
    }
  }

  factory ServerException(dynamic error) {
    late ServerException serverException;
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.connectionError:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.connectionError,
              statusCode: error.response?.statusCode,
              message: 'Connection Error',
            );
            break;
          case DioExceptionType.cancel:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.requestCancelled,
              statusCode: error.response?.statusCode,
              message: 'Request to the server has been canceled',
            );
            break;
          case DioExceptionType.connectionTimeout:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.requestTimeout,
              statusCode: error.response?.statusCode,
              message: 'Connection timeout',
            );
            break;
          case DioExceptionType.receiveTimeout:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.receiveTimeout,
              statusCode: error.response?.statusCode,
              message: 'Receive timeout',
            );
            break;
          case DioExceptionType.sendTimeout:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.sendTimeout,
              statusCode: error.response?.statusCode,
              message: 'Send timeout',
            );
            break;
          case DioExceptionType.badCertificate:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.badCertificate,
              statusCode: error.response?.statusCode,
              message: 'Bad Certificate',
            );
            break;
          case DioExceptionType.badResponse:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.badRequest,
              statusCode: error.response?.statusCode,
              message: 'Bad response',
            );
            break;
          case DioExceptionType.unknown:
            serverException = ServerException._(
              message: 'Unexpected error',
            );
            break;
        }
      } else {
        serverException = ServerException._(
          message: 'Unexpected error',
        );
      }
    } on FormatException catch (e) {
      serverException = ServerException._(
        exceptionType: ServerExceptionType.formatException,
        message: e.message,
      );
    } on Exception catch (_) {
      serverException = ServerException._(
        message: 'Unexpected error',
      );
    }
    return serverException;
  }

  ServerException._({
    required this.message,
    this.exceptionType = ServerExceptionType.unexpectedError,
    int? statusCode,
    // ignore: unused_element
    this.responseData,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  List<Object?> get props => [name, statusCode, exceptionType];
}
