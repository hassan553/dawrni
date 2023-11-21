import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Define this class for all gradient that can be used in the application
/// You can define [Gradient] , [LinearGradient] in the following way:
///
/// static const LinearGradient gradientName = LinearGradient(
///     colors: [_gradentColors],
///     begin: Alignment.bottomCenter,
///     end: Alignment.bottomLeft,
///   );

class AppGradients {

  // TODO: customize your gradents
  static const LinearGradient gradientName = LinearGradient(
    colors: [AppColors.black, AppColors.white],
    begin: Alignment.bottomCenter,
    end: Alignment.bottomLeft,
  );

  static LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primaryColor.withOpacity(0.3), AppColors.primaryColor],
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
  );
}
