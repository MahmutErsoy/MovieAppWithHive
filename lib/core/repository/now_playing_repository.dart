import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/core/constants/endpoints.dart';
import 'package:movie_app_with_hive/core/models/nowPlaying_movie_response_model.dart';
import 'package:movie_app_with_hive/core/network/exceptions.dart';
import 'package:movie_app_with_hive/core/network/network_data_manager.dart';

class NowPlayingRepository {
  NowPlayingRepository._privateConstructor(this.networkDataManager);
  static final NowPlayingRepository instance =
      NowPlayingRepository._privateConstructor(NetworkDataManager(Dio()));
  final NetworkDataManager networkDataManager;

  Future<Either<ServerException, NowPlayingMovieResponseModel>> getNowPlaying() async {
    try {
      var response = await Dio().get(
        Endpoints.getNowPlaying + AppConstants.apiKey,
      );
      final result = NowPlayingMovieResponseModel.fromJson(response.data);
      return Right(result);
    } on ServerException catch (err) {
      return Left(err);
    }
  }
}