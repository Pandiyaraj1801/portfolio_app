// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';
import 'package:portfolio/core/utils/themes/themes.dart';
import 'package:portfolio/features/screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor:
                MediaQuery.of(context).textScaleFactor * AppResponsive.scale,
          ),
          child: child!,
        );
      },
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: DashBoardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
