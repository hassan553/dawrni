import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/client/views/login_client_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/functions/global_function.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  int isArabic = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenSize(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Frame.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ),
        child: Stack(alignment: AlignmentDirectional.topCenter, children: [
          Container(
            color: Colors.black.withOpacity(.1),
          ),
          Column(
            children: [
              const CustomSizedBox(value: .1),
              // SvgPicture.asset('assets/Asset 12 1 (1).svg',
              //     colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              //     semanticsLabel: 'A red up arrow'),
              Image.asset(
                'assets/Asset 12 1.png',
                width: screenSize(context).width * .3,
                fit: BoxFit.fill,
              ),

              const CustomSizedBox(value: .08),
              const ResponsiveText(
                text: ' Please select your\npreferred language',
                scaleFactor: .08,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
              const CustomSizedBox(value: .07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      isArabic = 0;
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => navigateTo(LoginClientView()),
                      );
                    }),
                    child: SizedBox(
                      height: 160,
                      width: screenSize(context).width * .35,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            height: 130,
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 30),
                            decoration: BoxDecoration(
                                color: isArabic == 0
                                    ? const Color(0x19FF8700)
                                    : AppColors.offWhite.withOpacity(.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isArabic == 0
                                      ? AppColors.primaryColor
                                      : AppColors.offWhite.withOpacity(.1),
                                )),
                            child: Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: ResponsiveText(
                                text: 'English',
                                scaleFactor: .06,
                                fontWeight: FontWeight.w400,
                                color: isArabic == 0
                                    ? AppColors.primaryColor
                                    : AppColors.offWhite,
                              ),
                            ),
                          ),
                          Positioned(
                              top: -20,
                              child: Image.asset('assets/english.png')),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  InkWell(
                    onTap: () => setState(() {
                      isArabic = 1;
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => navigateTo(LoginClientView()),
                      );
                    }),
                    child: SizedBox(
                      height: 160,
                      width: screenSize(context).width * .35,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            height: 130,
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 30),
                            decoration: BoxDecoration(
                                color: isArabic == 1
                                    ? const Color(0x19FF8700)
                                    : AppColors.offWhite.withOpacity(.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isArabic == 1
                                      ? AppColors.primaryColor
                                      : AppColors.offWhite.withOpacity(.1),
                                )),
                            child: Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: ResponsiveText(
                                text: 'Arabic',
                                scaleFactor: .06,
                                fontWeight: FontWeight.w400,
                                color: isArabic == 1
                                    ? AppColors.primaryColor
                                    : AppColors.offWhite,
                              ),
                            ),
                          ),
                          Positioned(
                              top: -20,
                              child: Image.asset('assets/arabic.png')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
