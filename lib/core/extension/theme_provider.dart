import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_hive/core/constants/colors_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

ColorScheme _customColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: ColorConstants.instance.flamingo,
  onPrimary: ColorConstants.instance.flamingo,
  background: ColorConstants.instance.white,
  onBackground: ColorConstants.instance.white,
  secondary: ColorConstants.instance.bombay,
  onSecondary: ColorConstants.instance.bombay,
  error: ColorConstants.instance.bombay,
  onError: ColorConstants.instance.bombay,
  surface: ColorConstants.instance.bombay,
  onSurface: ColorConstants.instance.bombay,
);

String fontFamily = GoogleFonts.montserrat().fontFamily!;

class MyThemes {
  static final lightTheme = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: _customColorScheme.background,
    primaryColor: _customColorScheme.primary,
    focusColor: _customColorScheme.secondary,
    colorScheme: _customColorScheme,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 26.sp,
        color: ColorConstants.instance.codGray,
        fontWeight: FontWeight.w900,
      ),
      displayMedium: TextStyle(
        fontSize: 24.sp,
        color: ColorConstants.instance.codGray,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: 18.sp,
        color: ColorConstants.instance.bombay,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.codGray,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.codGray,
        fontWeight: FontWeight.w200,
      ),
      titleLarge: TextStyle(
        fontSize: 12.sp,
        color: ColorConstants.instance.codGray,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: _customColorScheme.background,
    primaryColor: _customColorScheme.primary,
    focusColor: _customColorScheme.secondary,
    colorScheme: _customColorScheme,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 18.sp,
        color: ColorConstants.instance.amber,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.amber,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.amber,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.amber,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.amber,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 11.sp,
        color: ColorConstants.instance.amber,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}