import 'package:dawrni/features/home/presentation/views/main_view.dart';
import 'package:go_router/go_router.dart';

class MainRoute {
  static const String name = '/main';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const MainView(),
  );
}
