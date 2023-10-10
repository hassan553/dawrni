import 'package:dawrni/features/onboarding/presentation/views/select_language_view.dart';
import 'package:go_router/go_router.dart';

class SelectLanguageRoute {
  static const String name = '/select_language';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const SelectLanguageView(),
  );
}
