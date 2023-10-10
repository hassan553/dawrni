import 'package:dawrni/features/appointments/presentation/views/appointments_view.dart';
import 'package:go_router/go_router.dart';

class AppointmentsRoute {
  static const String name = '/favorites';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => AppointmentsView(),
  );
}
