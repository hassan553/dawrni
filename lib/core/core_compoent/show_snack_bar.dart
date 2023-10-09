import 'package:flutter/material.dart';

// TODO: customize snack bar view

void showSnackBar(BuildContext context, String message) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        label: "close",
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
    ),
  );
}
