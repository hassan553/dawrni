import 'package:dawrni/features/auth/presentation/routes/forget_password_route.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/auth/presentation/routes/otp_verify_route.dart';
import 'package:dawrni/features/auth/presentation/routes/register_route.dart';
import 'package:dawrni/features/home/presentation/routes/all_company_route.dart';
import 'package:dawrni/features/home/presentation/routes/booking_route.dart';
import 'package:dawrni/features/home/presentation/routes/company_details_route.dart';
import 'package:dawrni/features/home/presentation/routes/favorites_route.dart';
import 'package:dawrni/features/home/presentation/routes/home_route.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:dawrni/features/home/presentation/routes/search_companies_route.dart';
import 'package:dawrni/features/onboarding/presentation/routes/onboarding_route.dart';
import 'package:dawrni/features/profile/presentation/routes/client_profile_route.dart';
import 'package:dawrni/features/profile/presentation/routes/company_edit_profile_route.dart';
import 'package:dawrni/features/settings/presentation/routes/about_us_route.dart';
import 'package:dawrni/features/settings/presentation/routes/contact_us_route.dart';
import 'package:dawrni/features/settings/presentation/routes/privacy_policy_route.dart';
import 'package:dawrni/features/settings/presentation/routes/setting_route.dart';
import 'package:go_router/go_router.dart';
import '../../features/appointments/presentation/routes/client_appointments_route.dart';
import '../../features/chats/presentation/routs/chats_details_route.dart';
import '../../features/chats/presentation/routs/chats_route.dart';
import '../../features/notifications/presentation/routes/notifications_route.dart';
import '../../features/onboarding/presentation/routes/select_language_route.dart';
import '../../features/onboarding/presentation/routes/splash_route.dart';
import '../../features/profile/presentation/routes/company_profile_route.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: SplashRoute.name,

    // TODO: add pages route here
    routes: [
      SplashRoute.route,
      RegisterRoute.route,
      OnboardingRoute.route,
      SelectLanguageRoute.route,
      LoginRoute.route,
      ForgetPasswordRoute.route,
      OtpVerifyRoute.route,
      HomeRoute.route,
      CompanyDetailsRoute.route,
      BookingRoute.route,
      AllCompanyRoute.route,
      NotificationsRoute.route,
      CompanyProfileRoute.route,
      UserProfileRoute.route,
      MainRoute.route,
      ChatsRoute.route,
      ChatsDetailsRoute.route,
      FavoritesRoute.route,
      ClientAppointmentsRoute.route,
      AboutUsRoute.route,
      ContactUsRoute.route,
      PrivacyPolicyRoute.route,
      SettingsRoute.route,
      SearchCompaniesRoute.route,
      CompanyEditProfileRoute.route
    ],
  );
}
