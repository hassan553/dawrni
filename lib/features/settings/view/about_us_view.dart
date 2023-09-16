import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            topPartText(),
            const SizedBox(height: 50),
            emailInfo(context),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customIcon('assets/Icon.png', 'Twitter'),
                customIcon('assets/Icon2.png', 'Facebook'),
                customIcon('assets/Group 215.png', 'LinkedIn'),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  Row customIcon(String image, String title) {
    return Row(
      children: [
        Image.asset(image),
        const SizedBox(width: 13),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
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

  SizedBox emailInfo(context) {
    return SizedBox(
      width: screenSize(context).width,
      child: Row(
        children: [
          Container(
            width: 89,
            height: 95,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Asset 12 1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Email ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ': ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' contact@dawrni.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Phone Number ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ':',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' +965 654 60315',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Website ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: 0.25,
                        ),
                      ),
                      TextSpan(
                        text: ': ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' www.dawrni.co',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
