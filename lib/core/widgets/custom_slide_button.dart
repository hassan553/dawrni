import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookBotton extends StatelessWidget {
  final void Function()? function;
  final String? title;
  final String? image;
  const BookBotton({
    super.key,
    this.function,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
          width: 100.w,
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
                color: AppColors.white,
                
              ),
              const Spacer(),
              Image.asset(image ?? 'assets/Group 34092.png'),
              const SizedBox(width: 10),
            ],
          )),
    );
  }
}
