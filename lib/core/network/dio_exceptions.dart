import 'dart:io';
import 'package:dio/dio.dart';
import '../constants/exception_types.dart';
import 'exceptions.dart';

ServerException handleException(error, String message) {
  if (error is Exception) {
    try {
      ServerException exception = ServerException(ExceptionType.unknownError, message);
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            exception = ServerException(ExceptionType.requestCancelled, message);
            break;
          case DioExceptionType.connectionTimeout:
            exception = ServerException(ExceptionType.requestTimeout, message);
            break;
          case DioExceptionType.receiveTimeout:
            exception = ServerException(ExceptionType.timeout, message);
            break;
          case DioExceptionType.badCertificate:
            exception = ServerException(ExceptionType.badCertificate, message);
            break;
          case DioExceptionType.badResponse:
            exception = ServerException(ExceptionType.badResponse, message);
            break;
          case DioExceptionType.connectionError:
            exception = ServerException(ExceptionType.connectionError, message);
            break;
          case DioExceptionType.sendTimeout:
            exception = ServerException(ExceptionType.timeout, message);
            break;
          case DioExceptionType.unknown:
            if (error.toString().contains('SocketException')) {
              exception = ServerException(ExceptionType.noInternetConnection, message);
              break;
            } else {
              exception = ServerException(ExceptionType.unknownError, message);
              break;
            }
        }
      } else if (error is SocketException) {
        exception = ServerException(ExceptionType.noInternetConnection, message);
      } else {
        exception = ServerException(ExceptionType.unknownError, message);
      }
      return exception;
    } on FormatException catch (_) {
      return ServerException(ExceptionType.formatException, message);
    } catch (_) {
      return ServerException(ExceptionType.unknownError, message);
    }
  } else {
    return ServerException(ExceptionType.unknownError, message);
  }
}