import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/features/onboarding/presentation/routes/onboarding_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/select_language_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _navigationToOnBoardingView(){
    Future.delayed(
        const Duration(seconds: 1), 
        () => context.pushReplacement(OnboardingRoute.name),);
  }
  @override
  void initState() {
    super.initState();
    _navigationToOnBoardingView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: AppColors.blackWithOpacity4,
          image: const DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage(ImagesPaths.splashBackgroundPng),
          ),
        ),
        child: Container(
          width: 289,
          height: 305,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesPaths.logPng),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
