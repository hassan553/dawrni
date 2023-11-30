import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/home/presentation/views/company_details_view.dart';
import 'package:go_router/go_router.dart';

class CompanyProfileRoute {
  static const String name = '/company_profile';
  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) => CompanyDetailsView(id: '',),
  );
}
