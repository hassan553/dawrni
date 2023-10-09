// import 'package:dawrni/core/extensions/ui_extensions/app_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.lable,
    required this.onTap,
    this.margin,
  }) : super(key: key);

  final String lable;
  final VoidCallback onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 14.w,
        margin: margin,
        // decoration: Theme.of(context).appButtonTheme,
        alignment: Alignment.center,
        child: Text(
          lable,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
