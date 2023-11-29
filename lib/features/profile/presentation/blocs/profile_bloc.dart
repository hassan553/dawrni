import 'dart:async';

import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/profile/domain/entities/user_profile_entity.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';
import 'package:dawrni/features/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, BaseState<UserProfileEntitiy>> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository)
      : super(const BaseState<UserProfileEntitiy>()) {
    on<GetUserProfileEvent>(_getUserProfile);
    on<PostUserProfileEvent>(_postUserProfile);
  }
  FutureOr<void> _getUserProfile(GetUserProfileEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository.getUserProfile();

    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }

  FutureOr<void> _postUserProfile(PostUserProfileEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository.postUserProfileInfo(
        UserProfileParameters(
            name: event.name,
            address: event.address,
            phoneNumber: event.phoneNumber,
            password: event.password,
            confirmPassword: event.confirmPassword));

    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
