import 'package:dawrni/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double scaleFactor;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  const ResponsiveText({
    super.key,
    required this.text,
    this.scaleFactor = 0.05,
    this.fontWeight = FontWeight.normal,
    this.color = AppColors.white,
    this.textAlign=TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * scaleFactor;
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
