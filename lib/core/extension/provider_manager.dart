import 'package:movie_app_with_hive/views/details_screen/detail_view_model.dart';
import 'package:movie_app_with_hive/views/home_screen/home_view_model.dart';
import 'package:movie_app_with_hive/views/main_view/main_view_model.dart';
import 'package:movie_app_with_hive/views/search_screen/search_view_model.dart';
import 'package:movie_app_with_hive/views/splash_screen/splash_view_model.dart';
import 'package:movie_app_with_hive/views/watch_list_screen/watch_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderManager {
  static ProviderManager? _instance;
  static ProviderManager get instance {
    _instance ??= ProviderManager._init();
    return _instance!;
  }

  ProviderManager._init();
  List<SingleChildWidget> singleProvider = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider<DetailViewModel>(
      create: (_) => DetailViewModel(),
    ),
    ChangeNotifierProvider<SearchViewModel>(
      create: (_) => SearchViewModel(),
    ),
    ChangeNotifierProvider<WatchListViewModel>(
      create: (_) => WatchListViewModel(),
    ),
    ChangeNotifierProvider<SplashViewModel>(
      create: (_) => SplashViewModel(),
    ),
    ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(),
    ),
  ];
}