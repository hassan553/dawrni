/// This code snippet demonstrates a function named `showToast` that displays a toast message using the Fluttertoast package.
/// The function takes a required `message` parameter for the content of the toast message, and optional parameters for customizing the appearance of the toast.

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_colors.dart';

/// The function `showToast` displays a toast message to the user.
/// It takes a required `message` parameter that represents the content of the toast.
/// The `color` parameter allows specifying a custom background color for the toast, defaulting to [AppColors.black].
/// The `textColor` parameter allows specifying a custom text color for the toast, defaulting to [AppColors.white].
///

void showToast({
  required String message,
  Color? color,
  Color? textColor,
}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color ?? AppColors.black,
    textColor: textColor ?? AppColors.white,
    fontSize: 14,
  );
}
