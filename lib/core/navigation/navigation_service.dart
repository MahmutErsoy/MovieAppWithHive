import 'package:flutter/material.dart';

import 'INavigation_service.dart';

class NavigationService implements NavigationServices {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  RoutePredicate get removeAllOldRoutes => (Route<dynamic> route) => false;
  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

 

  @override
  void popPage({Object? returnData}) {
    if (returnData is Map && returnData.containsKey('previousTab')) {
      final previousTab = returnData['previousTab'] as int;
      Navigator.of(navigatorKey.currentContext!).pop(previousTab);
    } else {
      navigatorKey.currentState!.pop();
    }
  }

  @override
  void popToNamed({required String path}) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(path));
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}