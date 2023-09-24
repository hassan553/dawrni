import 'package:get/get.dart';
import 'package:flutter/material.dart';

showDailog(String message) {
  Get.dialog(
    AlertDialog(
      title: const Text('Dialog Title'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
