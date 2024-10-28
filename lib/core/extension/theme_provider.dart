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
  background: ColorConstants.instance.charade,
  onBackground: ColorConstants.instance.white,
  secondary: ColorConstants.instance.bombay,
  onSecondary: ColorConstants.instance.bombay,
  error: ColorConstants.instance.bombay,
  onError: ColorConstants.instance.bombay,
  surface: ColorConstants.instance.charade,
  onSurface: ColorConstants.instance.bombay,
);

String fontFamily = GoogleFonts.montserrat().fontFamily!;

class MyThemes {
  static final lightTheme = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: _customColorScheme.surface,
    primaryColor: _customColorScheme.primary,
    focusColor: _customColorScheme.secondary,
    colorScheme: _customColorScheme,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        color: ColorConstants.instance.mulledWine,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.white,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.white,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 12.sp,
        color: ColorConstants.instance.white,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 12.sp,
        color: ColorConstants.instance.midGray,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 12.sp,
        color: ColorConstants.instance.flushOrange,
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
        color: ColorConstants.instance.flushOrange,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.flushOrange,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.flushOrange,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.flushOrange,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.flushOrange,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 11.sp,
        color: ColorConstants.instance.flushOrange,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}