import 'package:dawrni/features/home/presentation/views/all_company_view.dart';
import 'package:go_router/go_router.dart';

class AllCompanyRoute {
  static const String name = '/all_company';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const AllCompanyView(),
  );
}
