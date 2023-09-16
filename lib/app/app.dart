import 'package:dawrni/features/auth/client/views/forget_password_view.dart';
import 'package:dawrni/features/auth/client/views/login_client_view.dart';
import 'package:dawrni/features/auth/client/views/otp_view.dart';
import 'package:dawrni/features/auth/client/views/register_client_view.dart';
import 'package:dawrni/features/home/views/company_details_view.dart';
import 'package:dawrni/features/home/views/main_view.dart';
import 'package:dawrni/features/onboarding/views/select_language_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/rescourcs/app_theme.dart';
import '../features/onboarding/views/onboarding_view.dart';
import '../features/onboarding/views/splash_view.dart';

class Dawrni extends StatelessWidget {
  const Dawrni({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Dawrni',
      theme: appTheme(),
      textDirection: TextDirection.ltr,
      home: SplashView(),
    );
  }
}
