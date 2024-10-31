import 'package:dio/dio.dart';
import 'package:movie_app_with_hive/core/network/errors/exception.dart';

class NetworkDataManager {
  final Dio dio;

  NetworkDataManager(this.dio) {
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  Future<Response> get(String path, {queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response;
    } on DioException catch (err) {
      throw AppException(err.toString());
    }
  }

  Future<Response> post(String path, {data}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
      );
      return response;
    } catch (err) {
      throw AppException(err.toString());
    }
  }

  Future<Response> put(String path, {data}) async {
    try {
      final response = await dio.put(
        path,
        data: data,
      );
      return response;
    } on DioException catch (err) {
      throw AppException(err.toString());
    }
  }

  Future<Response> delete(String path, {data}) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
      );
      return response;
    } on DioException catch (err) {
      throw AppException(err.toString());
    }
  }
}