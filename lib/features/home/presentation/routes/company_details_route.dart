import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/home/presentation/blocs/company_details_bloc/company_details_bloc.dart';
import 'package:dawrni/features/home/presentation/views/company_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompanyDetailsRoute {
  static const String name = '/company_details';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => BlocProvider(
      create: (_) => sl<CompanyDetailsBloc>(),
        child: CompanyDetailsView(id: state.extra as String)),
  );
}
