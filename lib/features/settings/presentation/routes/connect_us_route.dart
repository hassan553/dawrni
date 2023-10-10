import 'package:dawrni/features/settings/presentation/views/connect_us.dart';
import 'package:go_router/go_router.dart';

class ConnectUsRoute {
  static const String name = '/connect_us';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => ConnectUsView(),
  );
}
