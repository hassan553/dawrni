import 'dart:async';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'companies_event.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, BaseState<CompaniesEntity>> {
  final HomeRepository homeRepository;

  CompaniesBloc(this.homeRepository)
      : super(const BaseState<CompaniesEntity>()) {
    on<FetchCompaniesEvent>(_getCompanies);
  }

  FutureOr<void> _getCompanies(FetchCompaniesEvent event, emit) async {
    emit(state.loading());
    final result = await homeRepository
        .getCompanies(const GetCompaniesParameters());
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
