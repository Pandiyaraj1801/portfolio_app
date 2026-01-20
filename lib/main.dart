import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/themes/themes.dart';
import 'package:portfolio/features/screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: DashBoardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
