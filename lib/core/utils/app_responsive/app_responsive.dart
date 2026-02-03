import 'package:flutter/material.dart';

class AppResponsive {
  static late double width;
  static late double height;
  static late double scale;

  static void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    width = mq.size.width;
    height = mq.size.height;

    if (width < 360) {
      scale = 0.85;
    } else if (width < 600) {
      scale = 1.0;
    } else if (width < 900) {
      scale = 1.15;
    } else {
      scale = 1.3;
    }
  }

  // 🔹 FONT
  static double font(double size) => size * scale;

  // Icon
  static double icon(double size) => size * scale;

  // 🔹 WIDTH & HEIGHT
  static double w(double value) => width * value;
  static double h(double value) => height * value;

  // 🔹 SPACING
  static double space(double value) => value * scale;

  static double get screenWidth => width;
  static double get screenHeight => height;
}
