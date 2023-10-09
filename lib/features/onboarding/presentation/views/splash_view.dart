import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(
      ///TODO: fix navigation
      //   const Duration(seconds: 2), () => navigateOff(const OnboardingView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.4),
          image: const DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage("assets/Asset 1 1.png"),
          ),
        ),
        child: Container(
          width: 289,
          height: 305,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/asset-12-1-CWB.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
