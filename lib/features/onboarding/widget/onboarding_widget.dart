
import 'package:dawrni/core/functions/global_function.dart';
import 'package:flutter/material.dart';

import '../data/model/onboarding_model.dart';

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
            width: screenSize(context).width,
            height: screenSize(context).height * .4,
          ),
          const SizedBox(height: 20),
          Image.asset(
            data.image2,
            fit: BoxFit.fill,
            height: 120,
          ),
        ],
      ),
    );
  }
}
