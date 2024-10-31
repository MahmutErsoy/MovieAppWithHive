import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/core/constants/endpoints.dart';
import 'package:movie_app_with_hive/core/models/upcoming_movie_response_model.dart';
import 'package:movie_app_with_hive/core/network/exceptions.dart';
import 'package:movie_app_with_hive/core/network/network_data_manager.dart';

class UpcomingRepository {
  UpcomingRepository._privateConstructor(this.networkDataManager);
  static final UpcomingRepository instance =
      UpcomingRepository._privateConstructor(NetworkDataManager(Dio()));
  final NetworkDataManager networkDataManager;

  Future<Either<ServerException, UpcomingMovieResponseModel>> getUpcoming() async {
    try {
      var response = await Dio().get(
        Endpoints.getUpcoming + AppConstants.apiKey,
      );
      final result = UpcomingMovieResponseModel.fromJson(response.data);
      return Right(result);
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}