import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomSizedBox extends StatelessWidget {
  final double value;
  const CustomSizedBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value.h,
    );
  }
}
