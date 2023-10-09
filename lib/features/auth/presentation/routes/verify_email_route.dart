import 'package:dawrni/features/auth/presentation/views/verify_email_view.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailRoute {
  static const String name = '/verify_email';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const VerifyEmailView(),
  );
}
