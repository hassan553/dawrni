import 'dart:async';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/get_company_details_parameters.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'company_details_event.dart';

class CompanyDetailsBloc extends Bloc<CompanyDetailsEvent, BaseState<CompanyEntity>> {
  final HomeRepository homeRepository;

  CompanyDetailsBloc(this.homeRepository)
      : super(const BaseState<CompanyEntity>()) {
    on<FetchCompanyDetailsEvent>(_getCompanyDetails);
  }

  FutureOr<void> _getCompanyDetails(FetchCompanyDetailsEvent event, emit) async {
    emit(state.loading());
    final result = await homeRepository
        .getCompanyDetails(GetCompanyDetailsParameters(id: event.id));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
