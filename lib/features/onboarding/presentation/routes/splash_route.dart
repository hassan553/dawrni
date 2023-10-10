import 'package:dawrni/features/onboarding/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class SplashRoute {
  static const String name = '/splash';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const SplashView(),
  );
}
