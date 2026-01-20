import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class AppThemes {
  static final ThemeData _lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightScaffoldColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.lightScaffoldColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
        letterSpacing: 0.9,
      ),
      displayMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
    ),
    colorScheme: ColorScheme.light(surface: AppColors.whiteColor),
  );

  static final ThemeData _darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkScaffoldColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.darkScaffoldColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
        letterSpacing: 0.9,
      ),
      displayMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    ),
    colorScheme: ColorScheme.dark(surface: AppColors.blackColor),
  );

  static ThemeData get lightTheme => _lightTheme;

  static ThemeData get darkTheme => _darkTheme;
}
