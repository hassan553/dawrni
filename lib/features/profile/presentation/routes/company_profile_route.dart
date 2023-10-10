import 'package:dawrni/features/home/presentation/views/company_details_view.dart';
import 'package:go_router/go_router.dart';

class CompanyProfileRoute {
  static const String name = '/company_profile';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => CompanyDetailsView(),
  );
}
