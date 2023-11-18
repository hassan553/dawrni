import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/enums/app_languages.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../auth/presentation/routes/login_client_route.dart';
import '../../../home/presentation/blocs/app_config_bloc/app_config_bloc.dart';

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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesPaths.framPng),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Stack(alignment: AlignmentDirectional.topCenter, children: [
              Container(
                color: AppColors.offBlack.withOpacity(.2),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Image.asset(
                    ImagesPaths.logPng,
                    width: 150.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 30.h),
                  ResponsiveText(
                    text: S.of(context).selectLanguage,
                    scaleFactor: .08,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  BlocBuilder<AppConfigBloc, AppConfigState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              isArabic = 0;
                              BlocProvider.of<AppConfigBloc>(context).add(
                                  const ChangeLanguageEvent(
                                      language: AppLanguages.english));
                              Future.delayed(
                                const Duration(milliseconds: 500),
                                () => context.pushReplacement(LoginRoute.name),
                              );
                            }),
                            child: SizedBox(
                              height: 160,
                              width: 150.w,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Container(
                                    height: 130,
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 30),
                                    decoration: BoxDecoration(
                                        color: isArabic == 0
                                            ? AppColors.offBrown
                                            : AppColors.offWhite
                                                .withOpacity(.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: isArabic == 0
                                              ? AppColors.primaryColor
                                              : AppColors.offWhite
                                                  .withOpacity(.1),
                                        )),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: ResponsiveText(
                                        text: S.of(context).english,
                                        scaleFactor: .06,
                                        fontWeight: FontWeight.w400,
                                        color: isArabic == 0
                                            ? AppColors.primaryColor
                                            : AppColors.offWhite,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 10,
                                      child:
                                          Image.asset(ImagesPaths.englishPng)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          InkWell(
                            onTap: () => setState(() {
                              isArabic = 1;
                              BlocProvider.of<AppConfigBloc>(context).add(
                                  const ChangeLanguageEvent(
                                      language: AppLanguages.arabic));
                              Future.delayed(
                                const Duration(milliseconds: 500),
                                () => context.pushReplacement(LoginRoute.name),
                              );
                            }),
                            child: SizedBox(
                              height: 160,
                              width: 150.w,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Container(
                                    height: 130,
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 30),
                                    decoration: BoxDecoration(
                                        color: isArabic == 1
                                            ? AppColors.offBrown
                                            : AppColors.offWhite
                                                .withOpacity(.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: isArabic == 1
                                              ? AppColors.primaryColor
                                              : AppColors.offWhite
                                                  .withOpacity(.1),
                                        )),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: ResponsiveText(
                                        text: S.of(context).arabic,
                                        scaleFactor: .06,
                                        fontWeight: FontWeight.w400,
                                        color: isArabic == 1
                                            ? AppColors.primaryColor
                                            : AppColors.offWhite,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    child: Image.asset(
                                      ImagesPaths.arabicPng,
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
