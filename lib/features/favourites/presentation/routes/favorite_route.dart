import 'package:dawrni/features/favourites/presentation/views/favourites_view.dart';
import 'package:go_router/go_router.dart';


class FavoritesRoute {
  static const String name = '/favorites';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => FavouriteView(),
  );
}
