import 'package:dawrni/app/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  //runApp(Dawrni());
  runApp(DevicePreview(
    builder: (context) => Dawrni(),
  ));
}
 /*
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  */