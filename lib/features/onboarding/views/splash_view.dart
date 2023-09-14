import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 428,
        height: 926,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF262626).withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -169,
              top: 200,
              child: Opacity(
                opacity: 0.06,
                child: Container(
                  width: 1193,
                  //height: 633,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Asset 12 1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 78,
              top: 266,
              child: Container(
                width: 289,
                height: 305,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Asset 12 1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
