import 'package:dawrni/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

class HomeRoute {
  static const String name = '/home';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const HomeView(),
  );
}
