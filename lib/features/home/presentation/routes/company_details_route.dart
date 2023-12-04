import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/presentation/blocs/book_bloc/book_bloc.dart';
import 'package:dawrni/features/home/presentation/views/company_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompanyDetailsRoute {
  static const String name = '/company_details';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => BlocProvider(
      create: (_) => sl<BookBloc>(),
      child: CompanyDetailsView(company: state.extra as CompanyEntity),
    ),
  );
}
