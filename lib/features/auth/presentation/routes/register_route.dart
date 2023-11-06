import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:dawrni/features/auth/presentation/views/register_client_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterRoute {
  static const String name = '/register';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: const RegisterView(),
    ),
  );
}
