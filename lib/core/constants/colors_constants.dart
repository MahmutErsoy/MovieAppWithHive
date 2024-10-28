import 'package:flutter/material.dart';

class ColorConstants {
  static final ColorConstants _instance = ColorConstants._init();
  static ColorConstants get instance => ColorConstants._instance;

  // app color
  Color flamingo = const Color(0xffF65C3D);
  Color bombay = const Color(0xffABAFB3);
  Color black = const Color(0xff000000);

  Color charade = const Color(0xff242A32);
  Color white = const Color(0xffFFFFFF);
  Color brightGray = const Color(0xff3A3F47);
  Color midGray = const Color(0xff67686D);
  Color cerulean = const Color(0xff0296E5);
  Color manatee = const Color(0xff92929D);
  Color mulledWine = const Color(0xff4E4B66);
  Color flushOrange = const Color(0xffFF8700);

  ColorConstants._init();
}