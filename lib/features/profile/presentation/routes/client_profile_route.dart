import 'package:dawrni/features/profile/presentation/views/user_profile_view.dart';
import 'package:go_router/go_router.dart';

class UserProfileRoute {
  static const String name = '/user_profile';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => throw UnimplementedError(),
  );
}
