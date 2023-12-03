import 'dart:async';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'company_profile_event.dart';

class CompanyProfileBloc
    extends Bloc<CompanyProfileEvent, BaseState<CompanyProfileEntity>> {
  final ProfileRepository profileRepository;

  CompanyProfileBloc(this.profileRepository)
      : super(const BaseState<CompanyProfileEntity>()) {
    on<FetchCompanyProfileEvent>(_getCompanyProfile);
  }

  FutureOr<void> _getCompanyProfile(
      FetchCompanyProfileEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository.getCompanyProfile();
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
