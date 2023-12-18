import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/domain/parameters/add_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/delete_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_client_profile_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_company_profile_parameters.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ClientProfileEntity>> getClientProfile();
  Future<Either<Failure, void>> updateClientProfile(UpdateClientProfileParameters parameters);
  Future<Either<Failure, void>> deleteClientProfileImage();
  Future<Either<Failure, CompanyProfileEntity>> getCompanyProfile();
  Future<Either<Failure, void>> updateCompanyProfile(UpdateCompanyProfileParameters parameters);
  Future<Either<Failure, void>> deleteCompanyProfileImage();
  Future<Either<Failure, void>> addCompanyPhoto(AddCompanyPhotoParameters parameters);
  Future<Either<Failure, void>> deleteCompanyPhoto(DeleteCompanyPhotoParameters parameters);
}
