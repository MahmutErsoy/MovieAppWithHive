import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view_model.dart';

class DetailViewModel extends BaseViewModel {
  bool isInit = false;

  bool isBookmarked = false;

  void toggleBookmark() {
    isBookmarked = !isBookmarked;
    notifyListeners();
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