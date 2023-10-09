import 'package:dawrni/features/auth/presentation/views/register_client_view.dart';
import 'package:go_router/go_router.dart';

class RegisterClientRoute {
  static const String name = '/register_client';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const RegisterClientView(),
  );
}
