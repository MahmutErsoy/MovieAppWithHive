import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view_model.dart';
import 'package:movie_app_with_hive/core/models/popular_movie_response_model.dart';
import 'package:movie_app_with_hive/core/repository/popular_repository.dart';
import 'package:movie_app_with_hive/core/use_cases/alert_dialog_helper.dart';

class HomeViewModel extends BaseViewModel {
  bool isInit = false;
  List<Results>? PopularList;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    await getPopular();
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  Future<void> getPopular() async {
    var response = await PopularRepository.instance.getPopular();
    response.fold((l) => AlertDialogHelper.instance.showErrorAlertMessage(context!, l.message),
        (r) {
      PopularList = r.results;
      PopularList!.sort(
          (a, b) => b.popularity!.compareTo(a.popularity!));
    });
  }
}