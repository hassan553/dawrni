part of 'edit_favorites_bloc.dart';

sealed class EditFavoritesEvent extends Equatable {
  const EditFavoritesEvent();
  @override
  List<Object> get props => [];
}

class AddToFavoritesEvent extends EditFavoritesEvent {
  final int id;
  const AddToFavoritesEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteFromFavoritesEvent extends EditFavoritesEvent {
  final int id;
  const DeleteFromFavoritesEvent({required this.id});

  @override
  List<Object> get props => [id];
}
