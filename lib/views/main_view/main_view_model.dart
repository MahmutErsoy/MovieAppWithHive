import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view_model.dart';
import 'package:movie_app_with_hive/core/constants/navigation_constants.dart';
import 'package:movie_app_with_hive/core/navigation/navigation_service.dart';
import 'package:movie_app_with_hive/views/home_screen/home_view.dart';
import 'package:movie_app_with_hive/views/search_screen/search_view.dart';
import 'package:movie_app_with_hive/views/watch_list_screen/watch_list_view.dart';



class MainViewModel extends BaseViewModel {
  bool isInit = false;

  int currentIndex = 0;

  final List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const SearchView(),
    const WatchListView(),
  ];

  void navigateTo(int index) {
    currentIndex = index;

    notifyListeners();
  }
  
  void updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> goToDetailView() async {
    await NavigationService.instance.navigateToPage(
      path: NavigationConstants.detailPage,
      data: {'previousTab': currentIndex},
    );
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }
}