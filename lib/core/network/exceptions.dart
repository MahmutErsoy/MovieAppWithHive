import '../constants/exception_types.dart';

class ServerException implements Exception {
  final ExceptionType exceptionType;
  final String message;


  ServerException(this.exceptionType, this.message);
}

class CacheException implements Exception {}