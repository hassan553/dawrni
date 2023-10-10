import 'package:dawrni/features/settings/presentation/views/settings_view.dart';
import 'package:go_router/go_router.dart';

class SettingsRoute {
  static const String name = '/settings';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => SettingsView(),
  );
}
