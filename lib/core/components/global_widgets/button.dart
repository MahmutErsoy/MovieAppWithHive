// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  bool? isActive;
  String? text;
  double width;
  double height;
  Function()? onPressed;
  TextStyle? textStyle;
  CustomButton({
    Key? key,
    this.isActive,
    this.onPressed,
    this.text,
    required this.height,
    this.textStyle,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all<Size>(Size(width, height)),
        elevation: WidgetStateProperty.all<double>(0.0),
        backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0.sp),
          ),
        ),
      ),
      child: Text(
        text!,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}