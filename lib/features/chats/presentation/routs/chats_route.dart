import 'package:go_router/go_router.dart';

import '../views/chats_view.dart';

class ChatsRoute {
  static const String name = '/chats';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const ChatHomeScreen(),
  );
}
