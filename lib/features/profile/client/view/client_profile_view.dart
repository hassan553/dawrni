import 'package:dawrni/core/functions/global_function.dart';
import 'package:flutter/material.dart';

import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class ClientProfileView extends StatelessWidget {
  const ClientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                      top: 0,
                      child: Image.asset(
                        'assets/rectangle-49-ZgK.png',
                        height: 150,
                        width: screenSize(context).width,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                    bottom: 0,
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/Rectangle 18.png'),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 5,
                            child: Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(40)),
                              child: const Icon(
                                Icons.border_color_outlined,
                                color: Colors.orange,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'Abdullah Alotaibi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  profileData('Abdullah Alotaibi'),
                  const SizedBox(height: 15),
                  profileData('+965 510 07579'),
                  const SizedBox(height: 15),
                  profileData('Password'),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    function: () {},
                    color: AppColors.primaryColor,
                    textColor: AppColors.white,
                    fontSize: .04,
                    title: ' Save Changes',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row profileData(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            cursorColor: AppColors.white,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const Icon(
          Icons.border_color_outlined,
          color: Colors.orange,
          size: 24,
        ),
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * .5, h + 100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
