import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).aboutUs),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(S.of(context).aboutUs, style: context.f18600),
            const SizedBox(height: 10),
            Text(S.of(context).getToKnowMoreAboutOurServices, style: context.f12400),
            const SizedBox(height: 50),
            buildContactInfo(context),
            const SizedBox(height: 70),
            FittedBox(
              child: Row(
                children: [
                  customIcon(context, ImagesPaths.twitterPng, S.of(context).twitter),
                  SizedBox(width: 20.w),
                  customIcon(context, ImagesPaths.facebookPng, S.of(context).facebook),
                  SizedBox(width: 20.w),
                  customIcon(context, ImagesPaths.linkedInPng, S.of(context).linkedin),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
              textAlign: TextAlign.start,
              style: context.f14400?.copyWith(height: 1.5),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  Widget buildContactInfo(BuildContext context) {
    return Row(
      children: [
        Image.asset(ImagesPaths.logPng, width: 90),
        const SizedBox(width: 20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildContactInfoLine(
                  context, "${S.of(context).email}: ", 'contact@dawrni.com'),
              buildContactInfoLine(
                  context, "${S.of(context).phoneNumber}: ", '+965 654 60315'),
              buildContactInfoLine(
                  context, "${S.of(context).website}: ", 'www.dawrni.co'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContactInfoLine(BuildContext context, String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RichText(
        text: TextSpan(
          text: key,
          style: context.f14700
              ?.copyWith(decoration: TextDecoration.underline, height: 1.5),
          children: <TextSpan>[
            TextSpan(
                text: value,
                style:
                    context.f14400?.copyWith(decoration: TextDecoration.none)),
          ],
        ),
      ),
    );
  }

  Widget customIcon(BuildContext context, String image, String title) {
    return Row(
      children: [
        Image.asset(image),
        const SizedBox(width: 10),
        Text(
          title,
          style: context.f15400,
        ),
      ],
    );
  }
}
