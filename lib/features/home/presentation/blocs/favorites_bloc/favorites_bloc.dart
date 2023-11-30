import 'dart:async';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/get_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/base_state.dart';

part 'favorites_event.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, BaseState<CompaniesEntity>> {
  final HomeRepository homeRepository;

  FavoritesBloc(this.homeRepository)
      : super(const BaseState<CompaniesEntity>()) {
    on<FetchFavoritesEvent>(_getFavorites);
  }

  int _page = 0;
  final int _length = 10;
  bool enablePullUp = true;
  List<CompanyEntity> _companies = [];
  final RefreshController refreshController = RefreshController();

  FutureOr<void> _getFavorites(FetchFavoritesEvent event, emit) async {
    if (event.refresh) {
      _page = 0;
      enablePullUp = true;
      _companies = [];
    }
    if(_page == 0) emit(state.loading());
    final result = await homeRepository
        .getFavorites(GetFavoritesParameters(
      offset:  _page * _length,
      limit: _length
    ));
    result.fold((l) => emit(state.error(l)), (r) {
      _page++;
      if(r.companies.isEmpty || r.companies.length < _length) {
        enablePullUp = false;
      }
      _companies = _companies + r.companies;
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      return emit(state.success(CompaniesEntity(companies: _companies), enablePullUp: enablePullUp));
    });
  }
}
