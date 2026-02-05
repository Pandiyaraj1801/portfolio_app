import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_responsive/app_responsive.dart';

class TxtHeader extends StatelessWidget {
  final String txt;
  final double fontSize;

  const TxtHeader({super.key, required this.txt, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Center(
      child: Text(
        txt,
        style: theme.textTheme.displayMedium?.copyWith(
          fontSize: AppResponsive.font(fontSize),
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
