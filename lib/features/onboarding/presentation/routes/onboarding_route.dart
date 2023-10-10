import 'package:dawrni/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class OnboardingRoute {
  static const String name = '/onboarding';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const OnboardingView(),
  );
}
