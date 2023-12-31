import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class EmptyChatWidget extends StatelessWidget {
  const EmptyChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesPaths.emptyChatPng,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).youDontHaveAnyMessagesYet,
            style: context.f16400,
          ),
        ],
      ),
    );
  }
}
