import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dawrni/core/widgets/show_awesomeDialog.dart';
import 'package:flutter/material.dart';

showSnackBarWidget(
    {required BuildContext context,
    required String message,
    required RequestStates requestStates}) {
  AnimatedSnackBar.material(
    message,
    duration: const Duration(milliseconds: 500),
    type: getAnimatedSnackBarType(requestStates),
  ).show(
    context,
  );
}

AnimatedSnackBarType getAnimatedSnackBarType(RequestStates requestStates) {
  switch (requestStates) {
    case RequestStates.success:
      return AnimatedSnackBarType.success;
    case RequestStates.error:
      return AnimatedSnackBarType.error;

    case RequestStates.warrning:
      return AnimatedSnackBarType.error;
  }
}
