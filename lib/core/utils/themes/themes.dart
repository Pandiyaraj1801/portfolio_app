import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/app_color.dart';

class AppThemes {
  static final ThemeData _lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightScaffoldColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.lightScaffoldColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: AppResponsive.font(23),
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      bodySmall: TextStyle(
        fontSize: AppResponsive.font(11),
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
        letterSpacing: 0.9,
      ),
      displayMedium: TextStyle(
        fontSize: AppResponsive.font(9),
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
    ),
    colorScheme: ColorScheme.light(surface: AppColors.whiteColor),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.whiteColor),
  );

  static final ThemeData _darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkScaffoldColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.darkScaffoldColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: AppResponsive.font(23),
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: AppResponsive.font(11),
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
        letterSpacing: 0.9,
      ),
      displayMedium: TextStyle(
        fontSize: AppResponsive.font(9),
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    ),
    colorScheme: ColorScheme.dark(surface: AppColors.blackColor),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.drawerBgColor),
  );

  static ThemeData get lightTheme => _lightTheme;

  static ThemeData get darkTheme => _darkTheme;
}
