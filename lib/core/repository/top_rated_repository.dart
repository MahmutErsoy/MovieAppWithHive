import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/core/constants/endpoints.dart';
import 'package:movie_app_with_hive/core/models/topRated_movie_response_model.dart';
import 'package:movie_app_with_hive/core/network/exceptions.dart';
import 'package:movie_app_with_hive/core/network/network_data_manager.dart';

class TopRatedRepository {
  TopRatedRepository._privateConstructor(this.networkDataManager);
  static final TopRatedRepository instance =
      TopRatedRepository._privateConstructor(NetworkDataManager(Dio()));
  final NetworkDataManager networkDataManager;

  Future<Either<ServerException, TopRatedMovieResponseModel>> getTopRated() async {
    try {
      var response = await Dio().get(
        Endpoints.getTopRated + AppConstants.apiKey,
      );
      final result = TopRatedMovieResponseModel.fromJson(response.data);
      return Right(result);
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}