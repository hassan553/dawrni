import 'package:dawrni/features/settings/presentation/views/contact_us.dart';
import 'package:go_router/go_router.dart';

class ContactUsRoute {
  static const String name = '/contact_us';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const ContactUsView(),
  );
}
