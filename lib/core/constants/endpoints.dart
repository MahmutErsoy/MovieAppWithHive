
import 'package:movie_app_with_hive/core/constants/app_constants.dart';

class Endpoints {
  Endpoints._();

  //POPULAR
  static const getPopular =
      "${AppConstants.baseUrl}/popular?api_key=";

  //NOW PLAYİNG
  static const getNowPlaying =
      "${AppConstants.baseUrl}/now_playing?api_key=";
  
  //TOP RATED
  static const getTopRated =
      "${AppConstants.baseUrl}/top_rated?api_key=";

  //UPCOMING
  static const getUpcoming =
      "${AppConstants.baseUrl}/upcoming?api_key=";
}