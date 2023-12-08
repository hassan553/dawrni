import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/presentation/blocs/update_profile_bloc/update_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/views/company_edit_profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompanyEditProfileRoute {
  static const String name = '/company_edit_profile';
  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) =>
        BlocProvider(
          create: (_) => sl<UpdateProfileBloc>(),
          child: CompanyEditProfileView(
              company: state.extra as CompanyProfileEntity),
        ),
  );
}
