import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/presentation/blocs/verify_email/verify_email_bloc.dart';
import 'package:dawrni/features/auth/presentation/views/otp_verify_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OtpVerifyRoute {
  static const String name = '/otp_verify';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) =>
        BlocProvider(
          create: (context) => sl<VerifyEmailBloc>(),
          child: OtpVerifyView(user: state.extra as UserEntity),
        ),
  );
}
