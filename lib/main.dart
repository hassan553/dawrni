import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dawrni/core/extension/language_extenstions/app_languages_extenstion.dart';
import 'package:dawrni/core/routes/app_routes.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/themes/app_theme.dart';
import 'package:dawrni/core/translations/app_local.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';

import 'package:dawrni/features/profile/data/repository/company_profile_repo.dart';


import 'package:dawrni/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/auth/presentation/blocs/login/login_bloc.dart';

late SharedPreferences sharedPreferences;

void main() async {
  // dynamic s = {
  //   "email": [
  //     "A user with that Email already exists."
  //   ]
  // };
  // var ss = s['message'] ?? (s as Map).entries.first.value;
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorageServices.init();
  await Firebase.initializeApp();
  ServicesLocator().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(Dawrni());
  // runApp(DevicePreview(
  //   builder: (context) => Dawrni(),
  // ));
}

class Dawrni extends StatelessWidget {
  const Dawrni({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AppConfigBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (_, child) {
          return AdaptiveTheme(
              light: AppTheme().darkTheme,
              dark: AppTheme().darkTheme,
              initial: AdaptiveThemeMode.dark,
              builder: (theme, darkTheme) {
                return BlocBuilder<AppConfigBloc, AppConfigState>(
                  bloc: sl(),
                  builder: (context, state) {
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      //useInheritedMediaQuery: true,
                      // locale: DevicePreview.locale(context),
                      //builder: DevicePreview.appBuilder,
                      title: 'Dawrni',
                      theme: theme,
                      darkTheme: darkTheme,
                      routerConfig: AppRoutes.router,
                      locale: AppLocale()
                          .currentLanguage()
                          .locale,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
