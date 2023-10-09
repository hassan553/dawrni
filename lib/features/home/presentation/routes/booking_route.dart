import 'package:dawrni/features/home/presentation/views/booking_view.dart';
import 'package:go_router/go_router.dart';

class BookingRoute {
  static const String name = '/booking';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const BookingView(),
  );
}
