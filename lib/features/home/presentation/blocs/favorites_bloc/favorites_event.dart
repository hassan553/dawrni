part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object> get props => [];
}

class FetchFavoritesEvent extends FavoritesEvent {
  final bool refresh;
  const FetchFavoritesEvent({this.refresh = false});

  @override
  List<Object> get props => [refresh];
}
