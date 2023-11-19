import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';

extension ContainerDecoration on ThemeData {
  BoxDecoration get authDecoration {
    return const BoxDecoration(
      color: AppColors.offBlack,
      image: DecorationImage(
        alignment: Alignment.bottomRight,
        image: AssetImage(ImagesPaths.splashBackgroundPng),
      ),
    );
  }
}