import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).privacyPolicy),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                S.of(context).privacyPolicy,
                textAlign: TextAlign.right,
                style: context.f18600,
              ),
              const SizedBox(height: 50),
              privacyWidget(context, '1. Types data we collect'),
              const SizedBox(height: 50),
              privacyWidget(context, '2. Use of your personal data'),
              const SizedBox(height: 50),
              privacyWidget(
                context,
                '3. Disclosure of your personal data',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column privacyWidget(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.f16700,
        ),
        const SizedBox(height: 20),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
          style: context.f14400?.copyWith(height: 1.6),
        ),
      ],
    );
  }
}
