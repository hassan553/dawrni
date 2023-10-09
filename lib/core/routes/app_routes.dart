import 'package:dawrni/features/auth/presentation/routes/forget_password_route.dart';
import 'package:dawrni/features/auth/presentation/routes/login_client_route.dart';
import 'package:dawrni/features/auth/presentation/routes/register_client_route.dart';
import 'package:dawrni/features/auth/presentation/routes/verify_email_route.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: LoginClientRoute.name,

    // TODO: add pages route here
    routes: [
      LoginClientRoute.route,
      RegisterClientRoute.route,
      ForgetPasswordRoute.route,
      // OtpLoginRoute.route,
      // OtpRegisterRoute.route,
      VerifyEmailRoute.route,
      MainRoute.route
    ],
  );
}
