import 'package:dawrni/features/notifications/presentation/views/notifications_view.dart';
import 'package:go_router/go_router.dart';

class NotificationsRoute {
  static const String name = '/notifications';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) =>  const NotificationsView(),
  );
}
