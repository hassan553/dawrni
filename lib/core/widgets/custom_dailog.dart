// import 'package:get/get.dart';
import 'package:flutter/material.dart';

showCustomDailog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text('This is a simple AlertDialog.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Close the AlertDialog
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
