import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';

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
                const TextSpan(text: 'This screen is still loading .. \n'),
                TextSpan(
                  text: 'Thank you',
                  style:
                      context.f16400?.copyWith(color: AppColors.primaryColor),
                ),
                const TextSpan(text: ' for your patience'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
