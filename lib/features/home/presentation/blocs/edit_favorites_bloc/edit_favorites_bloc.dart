import 'dart:async';
import 'package:dawrni/features/home/domain/parameters/add_to_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/delete_from_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'edit_favorites_event.dart';

class EditFavoritesBloc
    extends Bloc<EditFavoritesEvent, BaseState<void>> {
  final HomeRepository homeRepository;

  EditFavoritesBloc(this.homeRepository)
      : super(const BaseState<void>()) {
    on<AddToFavoritesEvent>(_addToFavorites);
    on<DeleteFromFavoritesEvent>(_deleteFromFavorites);
  }

  FutureOr<void> _addToFavorites(
      AddToFavoritesEvent event, emit) async {
    emit(state.loading());
    final result = await homeRepository.addToFavorites(
        AddToFavoritesParameters(id: event.id));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }

  FutureOr<void> _deleteFromFavorites(
      DeleteFromFavoritesEvent event, emit) async {
    emit(state.loading());
    final result = await homeRepository.deleteFromFavorites(
        DeleteFromFavoritesParameters(id: event.id));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
