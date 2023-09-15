import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xff262626),
    fontFamily: GoogleFonts.montserrat().fontFamily,
    primaryColor: AppColors.primaryColor,
    appBarTheme:
        const AppBarTheme(backgroundColor: Color(0xff262626), elevation: 0),
  );
}
