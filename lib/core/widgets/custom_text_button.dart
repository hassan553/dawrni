

import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function function;
  final  double fontSize;
  Color? color;
  Color? textColor;
  CustomTextButton({
    super.key,
    required this.function,
    required this.title,
    this.color,
    this.textColor,
    this.fontSize=.06,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function();
      },
      child: ResponsiveText(
        text: title,
        scaleFactor: fontSize,
        color: textColor??Colors.black,
      ),
    );
  }
}
