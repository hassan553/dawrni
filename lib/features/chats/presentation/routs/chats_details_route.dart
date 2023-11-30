import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:go_router/go_router.dart';

import '../views/chats_details_view.dart';

class ChatsDetailsRoute {
  static const String name = '/chats_details';

  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) =>  ChatDetailsView(data: {},id:''),
  );
}
