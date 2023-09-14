import 'package:flutter/material.dart';
import 'package:get/get.dart';

Size screenSize(context) {
  return MediaQuery.of(context).size;
}

navigateOff(Widget screen) {
  Get.off(screen);
}

navigateTo(Widget screen) {
  Get.to(screen);
}

pop() {
  Get.back();
}

navigatorOff(BuildContext context,Widget screen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => screen));
}
