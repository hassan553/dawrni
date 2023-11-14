import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesPaths.logPng,
      width: 150.w,
    );
  }
}
