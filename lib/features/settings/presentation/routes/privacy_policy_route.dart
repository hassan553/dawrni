import 'package:dawrni/features/settings/presentation/views/privacy_policy_view.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyRoute {
  static const String name = '/privacy_policy';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => PrivacyPolicyView(),
  );
}
