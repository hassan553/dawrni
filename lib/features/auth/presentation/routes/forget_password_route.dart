import 'package:dawrni/features/auth/presentation/views/forget_password_view.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordRoute {
  static const String name = '/forget_password';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const ForgetPasswordView(),
  );
}
