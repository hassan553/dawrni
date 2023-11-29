import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class LoadingChatWidget extends StatelessWidget {
  const LoadingChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesPaths.loadingChatPng,
            fit: BoxFit.fill,
            height: 300,
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: context.f16400,
              children: [
                TextSpan(text: S.of(context).thisScreenIsStillLoadingN),
                TextSpan(
                  text: S.of(context).thankYou,
                  style:
                      context.f16400?.copyWith(color: AppColors.primaryColor),
                ),
                 TextSpan(text: S.of(context).forYourPatience),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
