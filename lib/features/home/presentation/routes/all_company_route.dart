import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/home/presentation/views/all_company_view.dart';
import 'package:go_router/go_router.dart';

class AllCompanyRoute {
  static const String name = '/all_company';

  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) => const AllCompanyView(),
  );
}
