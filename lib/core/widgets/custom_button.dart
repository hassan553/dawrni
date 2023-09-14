import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? function;
  double fontSize;
  Color? color;
  Color? textColor;
  CustomButton({
    super.key,
    required this.function,
    required this.title,
    this.color,
    this.textColor,
    this.fontSize = 16,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: function,
      child: ResponsiveText(
        text: title,
        scaleFactor: fontSize,
        color: textColor ?? Colors.black,
      ),
    );
  }
}
