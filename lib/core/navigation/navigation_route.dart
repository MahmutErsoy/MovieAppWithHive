import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/constants/navigation_constants.dart';
import 'package:movie_app_with_hive/views/details_screen/detail_view.dart';
import 'package:movie_app_with_hive/views/home_screen/home_view.dart';
import 'package:movie_app_with_hive/views/search_screen/search_view.dart';
import 'package:movie_app_with_hive/views/watch_list_screen/watch_list_view.dart';


class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      // HOME
      case NavigationConstants.homePage:
        return normalNavigate(const HomeView(), NavigationConstants.homePage);
     // DETAİL
      case NavigationConstants.detailPage:
        final previousPage = args.arguments as String? ?? NavigationConstants.homePage;
        return normalNavigate(DetailView(previousPage: previousPage), NavigationConstants.detailPage);
      // SEARCH
      case NavigationConstants.searchPage:
        return normalNavigate(const SearchView(), NavigationConstants.searchPage);
      // WATCHLİST
      case NavigationConstants.watchlistPage:
        return normalNavigate(const WatchListView(), NavigationConstants.watchlistPage);
      //--DEFAULT--//
      default:
        return MaterialPageRoute(
          builder: (context) => const Text("Böyle Bir Sayfa Yok"),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName,
      {Object? data}) {
    return MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: pageName, arguments: data));
  }

  PageRouteBuilder animetedNavigate(Widget widget, String pageName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: pageName),
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation1, animation2) => widget,
      transitionsBuilder: (context, animation1, animation2, child) {
        return FadeTransition(opacity: animation1, child: child);
      },
    );
  }
}