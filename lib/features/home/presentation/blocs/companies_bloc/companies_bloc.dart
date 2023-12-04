import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/base_state.dart';

part 'companies_event.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, BaseState<CompaniesEntity>> {
  final HomeRepository homeRepository;

  CompaniesBloc(this.homeRepository)
      : super(const BaseState<CompaniesEntity>()) {
    on<FetchCompaniesEvent>(_getCompanies, transformer: restartable());
  }

  int _page = 0;
  final int _length = 10;
  bool enablePullUp = true;
  List<CompanyEntity> _companies = [];
  final RefreshController refreshController = RefreshController();
  String searchQuery = '';

  FutureOr<void> _getCompanies(FetchCompaniesEvent event, emit) async {
    if (event.refresh || event.searchQuery != searchQuery) {
      _page = 0;
      enablePullUp = true;
      _companies = [];
    }
    searchQuery = event.searchQuery;
    if(_page == 0) emit(state.loading());
    final result =
    await homeRepository.getCompanies(GetCompaniesParameters(offset: _page * _length, limit: _length, search: searchQuery, category: event.category));
    if (emit.isDone) return;
    // We should reach here only for latest event
    result.fold((l) => emit(state.error(l)), (r) {
      _page++;
      if(r.companies.isEmpty || r.companies.length < _length) {
        enablePullUp = false;
      }
      _companies = _companies + r.companies;
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      emit(state.success(CompaniesEntity(companies: _companies), enablePullUp: enablePullUp));
    });
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
