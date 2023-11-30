import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/appointments/presentation/blocs/client_appointments_bloc/client_appointments_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/delete_client_appointment_bloc/delete_client_appointment_bloc.dart';
import 'package:dawrni/features/appointments/presentation/views/client_appointments_view.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';

String str = S.current.bookNow;

class ClientAppointmentsRoute {
  static const String name = '/favorites';
  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) =>
        MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => sl<ClientAppointmentsBloc>(),
                ),
            BlocProvider(
              create: (context) => sl<DeleteClientAppointmentBloc>(),
            ),
          ],
          child: ClientAppointmentsView(),
        ),
  );
}
