import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../auth/presentation/routes/login_client_route.dart';

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
        height: 100.h,
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
              Image.asset(
                'assets/asset-12-1-CWB.png',
                width: 30.w,
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

                      ///TODO: CHECK THIS
                      // sharedPreferences.setBool(kIsArabic, false);
                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () => context.pushReplacement(LoginClientRoute.name),
                      );
                    }),
                    child: SizedBox(
                      height: 160,
                      width: 35.w,
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
                              top: 0, child: Image.asset('assets/english.png')),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  InkWell(
                    onTap: () => setState(() {
                      ///TODO: check this
                      // sharedPreferences.setBool(kIsArabic, true);
                      isArabic = 1;

                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () => context.pushReplacement(LoginClientRoute.name),
                      );
                    }),
                    child: SizedBox(
                      height: 160,
                      width: 35.w,
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
                            top: 0,
                            child: Image.asset(
                              'assets/arabic.png',
                              // fit: BoxFit.fill,
                            ),
                          ),
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
