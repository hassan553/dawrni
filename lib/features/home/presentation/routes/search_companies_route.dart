import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';
import 'package:dawrni/features/home/presentation/blocs/companies_bloc/companies_bloc.dart';
import 'package:dawrni/features/home/presentation/views/search_companies_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchCompaniesRoute {
  static const String name = '/search_companies';

  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) => BlocProvider(
        create: (_) => sl<CompaniesBloc>(),
        child: SearchCompaniesView(category: state.extra as CategoryEntity?)),
  );
}
