import 'dart:async';
import 'package:dawrni/features/profile/domain/parameters/add_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/delete_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_company_profile_parameters.dart';
import 'package:dawrni/features/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/base_state.dart';

part 'update_profile_event.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, BaseState<void>> {
  final ProfileRepository profileRepository;

  UpdateProfileBloc(this.profileRepository) : super(const BaseState<void>()) {
    on<UpdateCompanyProfileEvent>(_updateCompanyProfile);
    on<UpdateCompanyProfileImageEvent>(_updateCompanyProfileImage);
    on<DeleteCompanyProfileImageEvent>(_deleteCompanyProfileImage);
    on<AddCompanyPhotoEvent>(_addCompanyPhoto);
    on<DeleteCompanyPhotoEvent>(_deleteCompanyPhoto);
  }

  FutureOr<void> _updateCompanyProfile(
      UpdateCompanyProfileEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository.updateCompanyProfile(
        UpdateCompanyProfileParameters(
            nameEn: event.nameEn,
            nameAr: event.nameAr,
            addressEn: event.addressEn,
            addressAr: event.addressAr,
            aboutEn: event.aboutEn,
            aboutAr: event.aboutAr,
            categoryId: event.categoryId,
            lat: event.lat,
            lng: event.lng));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }

  FutureOr<void> _updateCompanyProfileImage(
      UpdateCompanyProfileImageEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository
        .updateCompanyProfile(UpdateCompanyProfileParameters(image: event.image));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }

  FutureOr<void> _deleteCompanyProfileImage(
      DeleteCompanyProfileImageEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository.deleteCompanyProfileImage();
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }

  FutureOr<void> _addCompanyPhoto(
      AddCompanyPhotoEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository
        .addCompanyPhoto(AddCompanyPhotoParameters(image: event.image));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }

  FutureOr<void> _deleteCompanyPhoto(
      DeleteCompanyPhotoEvent event, emit) async {
    emit(state.loading());
    final result = await profileRepository
        .deleteCompanyPhoto(DeleteCompanyPhotoParameters(id: event.id));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
