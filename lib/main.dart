import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dawrni/core/extension/language_extenstions/app_languages_extenstion.dart';
import 'package:dawrni/core/routes/app_routes.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/themes/app_theme.dart';
import 'package:dawrni/core/translations/app_local.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/profile/data/repository/client_profile_repo.dart';
import 'package:dawrni/features/profile/data/repository/company_profile_repo.dart';
import 'package:dawrni/features/profile/presentation/cubit/client/client_profile_cubit.dart';
import 'package:dawrni/features/profile/presentation/cubit/company/company_profile_cubit.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorageServices.init();
  await Firebase.initializeApp();
  ServicesLocator().init();
  // sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  //runApp(Dawrni());
  runApp(DevicePreview(
    builder: (context) => Dawrni(),
  ));
}

class Dawrni extends StatelessWidget {
  const Dawrni({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
              ClientProfileCubit(ClientProfileRepo())..fetchClientProfile()),
          BlocProvider(
              create: (context) => CompanyProfileCubit(CompanyProfileRepo())
                ..fetchCompanyProfile()),
          BlocProvider(create: (_) => sl<AppConfigBloc>()),
        ],
        child: AdaptiveTheme(
            light: AppTheme().darkTheme,
            dark: AppTheme().darkTheme,
            initial: AdaptiveThemeMode.dark,
            builder: (theme, darkTheme) {
              return BlocBuilder<AppConfigBloc,AppConfigState>(
                bloc: sl(),
                builder: (context, state) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    useInheritedMediaQuery: true,
                   // locale: DevicePreview.locale(context),
                    builder: DevicePreview.appBuilder,
                    title: 'Dawrni',
                    theme: theme,
                    darkTheme: darkTheme,
                    routerConfig: AppRoutes.router,
                    locale: AppLocale().currentLanguage().locale,
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
            }
        ),
      );
    });
  }
}
