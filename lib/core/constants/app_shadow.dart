import 'package:flutter/material.dart';
import 'app_colors.dart';

/// In this class we will define all the shadows assigned in the application,
/// and the [BoxShadow] will be defined by:
/// static BoxShadow shadowName = const BoxShadow(color: _shadowColor, blurRadius: _blurRadius);

class AppShadows {
  // TODO: customize your Shadow

  static BoxShadow normalShadow =
      const BoxShadow(color: AppColors.black, blurRadius: 20);
}
