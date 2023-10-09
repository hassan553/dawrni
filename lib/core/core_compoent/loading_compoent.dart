/// The [LoadingComponent] class is a reusable widget that displays a loading indicator at the center of the screen.
/// It is typically used to indicate that content is being loaded or processed.

import 'package:flutter/material.dart';

// TODO: customize Loading component view

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
