import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/utils/app_validator.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final name = TextEditingController();
  final email = TextEditingController();
  final description = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    description.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).contactUs),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(27),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Text(S.of(context).contactUs, style: context.f18600),
            const SizedBox(height: 10),
            Text(S.of(context).anyQuestionsOrRemarksJustWriteUsAMessage, style: context.f12400?.copyWith(color: AppColors.lighterGrey)),
            const SizedBox(height: 50),
                AppTextField(
                  labelText: S.of(context).full_name,
                  controller: name,
                  hintText: S.of(context).nameHint,
                  validator: AppValidator(validators: [
                    InputValidator.requiredField,
                  ]).validate,
                  prefixIcon: Image.asset(ImagesPaths.personPng),
                ),
            const SizedBox(height: 20),
                AppTextField(
                  labelText: S.of(context).email,
                  controller: email,
                  hintText: S.of(context).emailHint,
                  validator: AppValidator(validators: [
                    InputValidator.requiredField,
                    InputValidator.email
                  ]).validate,
                  prefixIcon: const Icon(Icons.email_outlined, color: AppColors.lighterGrey),
                ),
            const SizedBox(height: 20),
                AppTextField(
                  labelText: S.of(context).message,
                  controller: description,
                  hintText: S.of(context).message,
                  validator: AppValidator(validators: [
                    InputValidator.requiredField
                  ]).validate,
                  maxLines: 8,
                ),
            const SizedBox(height: 40),
            AppButton(
              text: S.of(context).sendMessage,
                onPressed: () {}),
          ]),
        ),
      ),
    );
  }
}
