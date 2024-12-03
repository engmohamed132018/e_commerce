import 'package:flutter/material.dart';

class Appsize {
  static final size = MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.first)
      .size;

  static double setHeight({required double height}) {
    return (height / 812) * size.height;
  }

  static double setWidth({required double width}) {
    return (width / 375) * size.width;
  }

  static double setfont({required double font}) {
    return (font / 812) * size.height;
  }

  static double setRaduis({required double raduis}) {
    return (raduis / 375) * size.width;
  }
}
