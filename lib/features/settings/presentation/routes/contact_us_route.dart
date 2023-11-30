import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/settings/presentation/views/contact_us.dart';
import 'package:go_router/go_router.dart';

class ContactUsRoute {
  static const String name = '/contact_us';
  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) => const ContactUsView(),
  );
}
