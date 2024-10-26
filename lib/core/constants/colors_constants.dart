import 'package:flutter/material.dart';

class ColorConstants {
  static final ColorConstants _instance = ColorConstants._init();
  static ColorConstants get instance => ColorConstants._instance;

  // app color
  Color flamingo = const Color(0xffF65C3D);
  Color white = const Color(0xffFFFFFF);
  Color codGray = const Color(0xff0A0A0A);
  Color whisper = const Color(0xffF8F8FB);
  Color bombay = const Color(0xffABAFB3);
  Color dodgerBlue = const Color(0xff3375FE);
  Color malachite = const Color(0xff01C448);
  Color amber = const Color(0xffFEBF00);
  Color black = const Color(0xff000000);

  ColorConstants._init();
}