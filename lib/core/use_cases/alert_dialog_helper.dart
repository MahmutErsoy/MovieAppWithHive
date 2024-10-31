import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/components/global_widgets/alert_dialog.dart';

class AlertDialogHelper {
  static final AlertDialogHelper _instance = AlertDialogHelper._init();

  static AlertDialogHelper get instance => _instance;

  AlertDialogHelper._init();


  Future showErrorAlertMessage(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
              buttonText: "Tamam",
              message: message,
              onButtonPressed: () {
                Navigator.of(context).pop();
              });
        });
  }
}