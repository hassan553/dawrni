import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/features/home/presentation/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:dawrni/features/home/presentation/views/favorites_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class FavoritesRoute {
  static const String name = '/favorites';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) =>
        const FavoritesView(),
  );
}
