part of 'update_profile_bloc.dart';

sealed class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();
  @override
  List<Object?> get props => [];
}

class UpdateCompanyProfileEvent extends UpdateProfileEvent {
  final String? nameEn;
  final String? nameAr;
  final String? addressEn;
  final String? addressAr;
  final String? aboutEn;
  final String? aboutAr;
  final int? categoryId;
  final double? lat;
  final double? lng;

  const UpdateCompanyProfileEvent({
    this.nameEn,
    this.nameAr,
    this.addressEn,
    this.addressAr,
    this.aboutEn,
    this.aboutAr,
    this.categoryId,
    this.lat,
    this.lng
  });

  @override
  List<Object?> get props => [nameEn, nameAr, addressEn, addressAr, aboutEn, aboutAr, categoryId, lat, lng];
}

class UpdateCompanyProfileImageEvent extends UpdateProfileEvent {
  final XFile image;

  const UpdateCompanyProfileImageEvent({
    required this.image
  });

  @override
  List<Object?> get props => [image];
}

class DeleteCompanyProfileImageEvent extends UpdateProfileEvent {
  const DeleteCompanyProfileImageEvent();

  @override
  List<Object?> get props => [];
}

class AddCompanyPhotoEvent extends UpdateProfileEvent {
  final XFile image;

  const AddCompanyPhotoEvent({
    required this.image
  });

  @override
  List<Object?> get props => [image];
}

class DeleteCompanyPhotoEvent extends UpdateProfileEvent {
  final int id;
  const DeleteCompanyPhotoEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
