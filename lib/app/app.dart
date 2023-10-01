import 'package:dawrni/core/contants/constants.dart';
import 'package:dawrni/features/auth/cubit/auth_cubit.dart';
import 'package:dawrni/features/auth/data/repository/auth_repo.dart';
import 'package:dawrni/features/profile/cubit/client/client_profile_cubit.dart';
import 'package:dawrni/features/profile/cubit/company/company_profile_cubit.dart';
import 'package:dawrni/features/profile/data/repository/client_profile_repo.dart';
import 'package:dawrni/features/profile/data/repository/company_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../core/rescourcs/app_theme.dart';
import '../features/onboarding/views/splash_view.dart';

class Dawrni extends StatelessWidget {
  const Dawrni({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRepo())),
        BlocProvider(
            create: (context) =>
                ClientProfileCubit(ClientProfileRepo())..fetchClientProfile()),
        BlocProvider(
            create: (context) => CompanyProfileCubit(CompanyProfileRepo())
              ..fetchCompanyProfile()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        title: 'Dawrni',
        theme: appTheme(),
        textDirection: TextDirection.ltr,
        home: const SplashView(),
      ),
    );
  }
}
