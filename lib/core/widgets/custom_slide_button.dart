import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookBotton extends StatelessWidget {
  final void Function()? function;
  final String? title;
  const BookBotton({
    super.key,
    this.function,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
          width: screenSize(context).width,
          height: 50,
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(-1.00, -0.00),
              end: Alignment(1, 0),
              colors: [
                Color(0x4CFF8700),
                Color(0xFFFF8700),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResponsiveText(
                text: title ?? " ",
                scaleFactor: .05,
                color: AppColors.white,
              ),
              const Spacer(),
              Image.asset('assets/Group 34092.png'),
              const SizedBox(width: 10),
            ],
          )),
    );
  }
}
