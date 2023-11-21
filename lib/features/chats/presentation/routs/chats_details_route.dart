import 'package:dawrni/features/home/presentation/views/booking_view.dart';
import 'package:go_router/go_router.dart';

import '../views/chats_details_view.dart';

class ChatsDetailsRoute {
  static const String name = '/chats_details';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) =>  ChatDetailsView(data: {},id:''),
  );
}
