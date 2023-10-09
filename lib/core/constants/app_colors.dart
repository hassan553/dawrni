import 'package:flutter/material.dart';

/// Define this class for all colors that can be used in the application
/// You can define [Color] in the following way:
///
/// static const Color colorName = Color(colorHex);
///
///
/// You can also define [MaterialColor] in the same class in the following way:
///
/// static const MaterialColor materialColor = MaterialColor(
///     colorHex,
///     <int, Color>{
///       50: Color(colorHex50),
///       100: Color(colorHex100),
///       200: Color(colorHex200),
///       300: Color(colorHex300),
///       400: Color(colorHex400),
///       500: Color(colorHex500),
///       600: Color(colorHex600),
///       700: Color(colorHex700),
///       800: Color(colorHex800),
///       900: Color(colorHex900),
///     },
///   );

class AppColors {
  static const primaryColor = Color(0xffFF8700);
  static const black = Colors.black;
  static const secondColor = Color(0xff3B3B3B);
  static const white = Colors.white;
  static Color offWhite = Colors.white.withOpacity(.6);

  // TODO: customize your Colors
  static const Color green = Color(0xFF4CAF50);
  static const Color darkGrey = Color(0xFFB1B1B1);
  static const Color greyAccent = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFFC7C7C7);
  // static const Color black = Color(0xFF333333);
  static const Color blue = Color(0xFF0978F2);
  static const Color red = Color(0xFFFF5757);
  // static const Color white = Color(0xFFFFFFFF);

  static const MaterialColor materialColor = MaterialColor(
    0X00000000,
    <int, Color>{
      50: Color(0X00000000),
      100: Color(0X00000000),
      200: Color(0X00000000),
      300: Color(0X00000000),
      400: Color(0X00000000),
      500: Color(0X00000000),
      600: Color(0X00000000),
      700: Color(0X00000000),
      800: Color(0X00000000),
      900: Color(0X00000000),
    },
  );
}
