import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Privacy Policy',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 50),
              privacyWidget('1. Types data we collect'),
              const SizedBox(height: 50),
              privacyWidget('2. Use of your personal data'),
              const SizedBox(height: 50),
              privacyWidget(
                '3. Disclosure of your personal data',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column privacyWidget(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(.7),
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
          style: TextStyle(
            color: Colors.white.withOpacity(.6),
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  AppBar settingAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () => pop(),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.only(start: 10),
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.10000000149011612),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  Column topPartText() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Us',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: -0.09,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Get to know more about our services',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF7B7B7B),
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: -0.06,
          ),
        ),
      ],
    );
  }
}
