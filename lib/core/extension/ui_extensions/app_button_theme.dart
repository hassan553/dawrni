import 'package:flutter/material.dart';

extension AppButtonTheme on ThemeData {
  // TODO: Customize app button decoration properties here

  BoxDecoration get appButtonTheme {
    return BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(4),
    );
  }
}
