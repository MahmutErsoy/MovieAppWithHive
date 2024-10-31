import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/core/constants/endpoints.dart';
import 'package:movie_app_with_hive/core/models/popular_movie_response_model.dart';
import 'package:movie_app_with_hive/core/network/exceptions.dart';
import 'package:movie_app_with_hive/core/network/network_data_manager.dart';

class PopularRepository {
  PopularRepository._privateConstructor(this.networkDataManager);
  static final PopularRepository instance =
      PopularRepository._privateConstructor(NetworkDataManager(Dio()));
  final NetworkDataManager networkDataManager;

  Future<Either<ServerException, PopularMovieResponseModel>> getPopular() async {
    try {
      var response = await Dio().get(
        Endpoints.getPopular + AppConstants.apiKey,
      );
      final result = PopularMovieResponseModel.fromJson(response.data);
      return Right(result);
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}