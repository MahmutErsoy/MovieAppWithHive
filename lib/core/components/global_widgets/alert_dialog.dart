// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_with_hive/core/components/global_widgets/button.dart';
import 'package:movie_app_with_hive/core/constants/colors_constants.dart';

class CustomAlertDialog extends StatelessWidget {
  final Widget? content;
  final String? message;
  final String? buttonText;
  EdgeInsetsGeometry? contentPadding;
  Function()? onButtonPressed;

  CustomAlertDialog(
      {Key? key,
      this.message,
      this.content,
      this.contentPadding,
      this.buttonText,
      this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          contentPadding ?? EdgeInsets.only(right: 25.w, top: 25.h, bottom: 5.h, left: 25.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.sp))),
      content: message != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message!,
                textAlign: TextAlign.center,
              ),
            )
          : content,
      backgroundColor: ColorConstants.instance.white,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.w),
      actions: <Widget>[
        CustomButton(
          height: 42.h,
          isActive: true,
          text: buttonText,
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 16.sp,
              ),
          onPressed: onButtonPressed!,
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}