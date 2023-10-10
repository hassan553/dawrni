import 'package:dawrni/features/profile/presentation/views/client_profile_view.dart';
import 'package:go_router/go_router.dart';

class ClientProfileRoute {
  static const String name = '/client_profile';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => ClientProfileView(),
  );
}
