import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_colors.dart';

/// This class [AppTheme] is defined to contain two basic variables that represent the application's theme,
///  where [darkTheme] represents the dark theme, [lightTheme] represents the basic theme.
///

class AppTheme {
  static AppTheme? _instance;
  AppTheme._();
  factory AppTheme() => _instance ??= AppTheme._();

  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xff262626),
    // fontFamily:'Montserrat',
    primaryColor: AppColors.primaryColor,
    appBarTheme:
    const AppBarTheme(backgroundColor: Color(0xff262626), elevation: 0),

    // brightness: Brightness.light,
    // useMaterial3: true,
    // primaryColor: AppColors.green,
    // textTheme: TextTheme(
    //   displayLarge: TextStyle(
    //     fontSize: 15.sp,
    //     color: AppColors.green,
    //     fontWeight: FontWeight.w600,
    //   ),
    //   displayMedium: TextStyle(fontSize: 12.5.sp, color: AppColors.darkGrey),
    //   displaySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.green),
    //   bodySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.black),
    //   bodyLarge: TextStyle(
    //     fontSize: 11.sp,
    //     color: AppColors.black,
    //     fontWeight: FontWeight.w300,
    //   ),
    //   bodyMedium: TextStyle(fontSize: 11.5.sp, color: AppColors.white),
    // ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.white,
    //   elevation: 0,
    //   iconTheme: const IconThemeData(color: AppColors.black),
    //   toolbarTextStyle: TextStyle(
    //     color: AppColors.black,
    //     fontSize: 14.sp,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
    // scaffoldBackgroundColor: AppColors.white,
    // inputDecorationTheme: InputDecorationTheme(
    //   iconColor: AppColors.darkGrey,
    //   hintStyle: const TextStyle(color: AppColors.darkGrey),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.greyAccent),
    //   ),
    //   suffixIconColor: AppColors.green,
    //   prefixIconColor: AppColors.darkGrey,
    //   filled: true,
    //   fillColor: AppColors.greyAccent,
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.greyAccent, width: 1),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.red, width: 1.6),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.red, width: 1),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.green, width: 1.6),
    //   ),
    //   labelStyle: const TextStyle(color: AppColors.green),
    //   errorStyle: const TextStyle(color: AppColors.red),
    //   counterStyle: const TextStyle(color: AppColors.black),
    //   isDense: true,
    //   helperStyle: const TextStyle(color: AppColors.black),
    //   suffixStyle: const TextStyle(color: AppColors.black),
    //   prefixStyle: const TextStyle(color: AppColors.black),
    // ),
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: AppColors.green,
    // ),
    // snackBarTheme: SnackBarThemeData(
    //   backgroundColor: AppColors.green.withOpacity(0.8),
    //   contentTextStyle: const TextStyle(color: AppColors.white),
    //   actionTextColor: AppColors.white,
    // ),



  );

  final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.green,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 15.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.white),
      displayMedium: TextStyle(fontSize: 12.5.sp, color: AppColors.white),
      displaySmall: TextStyle(fontSize: 12.5.sp, color: AppColors.green),
      bodyLarge: TextStyle(fontSize: 11.sp, color: AppColors.white),
      bodyMedium: TextStyle(fontSize: 11.sp, color: AppColors.black),
    ),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.darkGrey,
      hintStyle: const TextStyle(color: AppColors.darkGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyAccent),
      ),
      suffixIconColor: AppColors.green,
      prefixIconColor: AppColors.darkGrey,
      filled: true,
      fillColor: AppColors.greyAccent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.green, width: 1.6),
      ),
      isDense: true,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.green,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkGrey,
      contentTextStyle: TextStyle(color: AppColors.white),
      actionTextColor: AppColors.green,
    ),
  );

  void changeTheme(BuildContext context) =>
      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
          ? AdaptiveTheme.of(context).setDark()
          : AdaptiveTheme.of(context).setLight();

  bool isLight(BuildContext context) =>
      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light;

  bool isDark(BuildContext context) =>
      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
}
