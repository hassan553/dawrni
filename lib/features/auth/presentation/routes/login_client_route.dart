import 'package:dawrni/features/auth/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';

class LoginRoute {
  static const String name = '/login_client';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => LoginClientView(),
  );
}
