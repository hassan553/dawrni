import 'package:dawrni/features/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40.0),
          Image.asset(
            data.image,
            fit: BoxFit.fill,
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight / 3,
          ),
          const SizedBox(height: 30),
          Image.asset(
            data.image2,
            fit: BoxFit.fill,
            height: 130,
          ),
        ],
      ),
    );
  }
}
