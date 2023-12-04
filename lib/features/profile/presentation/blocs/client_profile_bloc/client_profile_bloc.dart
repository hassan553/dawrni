import 'dart:async';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';
import 'package:dawrni/features/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'client_profile_event.dart';

class ClientProfileBloc
    extends Bloc<ClientProfileEvent, BaseState<ClientProfileEntity>> {
  final ProfileRepository profileRepository;

  ClientProfileBloc(this.profileRepository)
      : super(const BaseState<ClientProfileEntity>()) {
    on<FetchClientProfileEvent>(_getClientProfile);
  }

  FutureOr<void> _getClientProfile(
      FetchClientProfileEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository.getClientProfile();
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
