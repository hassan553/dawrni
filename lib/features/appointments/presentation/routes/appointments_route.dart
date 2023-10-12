import 'package:dawrni/features/appointments/presentation/views/appointments_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
String str=S.current.bookNow;

class AppointmentsRoute {
  static const String name = '/favorites';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => AppointmentsView(),
  );
}
