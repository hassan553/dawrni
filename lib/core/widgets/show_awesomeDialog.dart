// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum RequestStates { success, error, warrning }

String checkStatus(RequestStates states) {
  if (states == RequestStates.success) {
    return 'assets/Tick.png';
  } else if (states == RequestStates.error) {
    return 'assets/404 Error.png';
  } else {
    return 'assets/Alert.png';
  }
}

showAwesomeDialog({
  required BuildContext context,
  RequestStates? status,
  String? description,
  String? buttonText,
}) {
  ///TODO: IMPLEMENT A DIALOG
  throw UnimplementedError('No Dialog Implemented');
  // AwesomeDialog(
  //         context: context,
  //         dialogType: DialogType.error,
  //         animType: AnimType.rightSlide,
  //         desc: description,
  //         descTextStyle: const TextStyle(color: AppColors.white),
  //         btnOkOnPress: () {},
  //         btnOkText: buttonText ?? 'cancel',
  //         btnOkColor: AppColors.primaryColor,
  //         dialogBackgroundColor: const Color(0xff262626),
  //         barrierColor: const Color(0xff3B3B3B).withOpacity(.85),
  //         customHeader: Image.asset(checkStatus(status ?? RequestStates.error)))
  //     .show();
}
