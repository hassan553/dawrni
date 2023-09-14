import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xff262626),
    primaryColor: AppColors.primaryColor,
    appBarTheme:
        const AppBarTheme(backgroundColor: Color(0xff262626), elevation: 0),
  );
}
