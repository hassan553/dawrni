import 'package:dawrni/features/settings/presentation/views/about_us_view.dart';
import 'package:go_router/go_router.dart';

class AboutUsRoute {
  static const String name = '/about_us';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => AboutUsView(),
  );
}
