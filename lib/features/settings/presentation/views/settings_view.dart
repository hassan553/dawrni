import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var notification = BooleanWrapper(true);
  var update = BooleanWrapper(false);
  var promotions = BooleanWrapper(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(27.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          Text(S.of(context).generalSettings, style: context.f18600),
          const SizedBox(height: 10),
          Text(S.of(context).personalizeYourExperience,
              style: context.f12400?.copyWith(color: AppColors.lighterGrey)),
          const SizedBox(height: 60),
          customSwitchButton(S.of(context).generalNotification, notification),
          const SizedBox(height: 20),
          customSwitchButton(S.of(context).appUpdates, update),
          const SizedBox(height: 20),
          customSwitchButton(S.of(context).promotions, promotions),
        ]),
      ),
    );
  }

  Row customSwitchButton(String title, BooleanWrapper values) {
    return Row(
      children: [
        Text(
          title,
          style: context.f15400,
        ),
        const Spacer(),
        Switch(
          activeColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.offWhite,
          value: values.value,
          onChanged: (value) {
            setState(() {
              values.value = value;
            });
          },
        ),
      ],
    );
  }
}

class BooleanWrapper {
  bool value;

  BooleanWrapper(this.value);
}
