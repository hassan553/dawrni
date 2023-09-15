import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/features/onboarding/views/onboarding_view.dart';
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
    Future.delayed(
        const Duration(seconds: 2), () => navigateOff(const OnboardingView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            bottom: -230,
            right: -150,
            child: Image.asset(
              "assets/Asset 12 1.png",
              fit: BoxFit.fill,
              width: screenSize(context).width,
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: ShapeDecoration(
              color: const Color(0xFF262626).withOpacity(.83),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Container(
              width: 289,
              height: 305,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Asset 12 1.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // child: Stack(
            //   children: [
            //     Positioned(
            //       left: -169,
            //       top: 200,
            //       child: Opacity(
            //         opacity: 0.06,
            //         child: Container(
            //           width: 1193,
            //           decoration: const BoxDecoration(
            //             image: DecorationImage(
            //               image: AssetImage("assets/Asset 12 1.png"),
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       left: 78,
            //       top: 266,
            //       child: Container(
            //         width: 289,
            //         height: 305,
            //         decoration: const BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage("assets/Asset 12 1.png"),
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
