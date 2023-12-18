import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/errors_handler.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/profile/data/data_source/profile_data_source.dart';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/domain/parameters/add_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/delete_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_client_profile_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_company_profile_parameters.dart';
import 'package:dawrni/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImp(this.profileDataSource);

  @override
  Future<Either<Failure, ClientProfileEntity>> getClientProfile() async {
    return ErrorsHandler.handleEither(
        () => profileDataSource.getClientProfile());
  }

  @override
  Future<Either<Failure, void>> updateClientProfile(
      UpdateClientProfileParameters parameters) async {
    try {
      await profileDataSource.updateClientProfile(parameters);
      return const Right(null);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteClientProfileImage() async {
    try {
      await profileDataSource.deleteClientProfileImage();
      return const Right(null);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, CompanyProfileEntity>> getCompanyProfile() {
    return ErrorsHandler.handleEither(
        () => profileDataSource.getCompanyProfile());
  }

  @override
  Future<Either<Failure, void>> updateCompanyProfile(
      UpdateCompanyProfileParameters parameters) async {
    try {
      await profileDataSource.updateCompanyProfile(parameters);
      return const Right(null);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCompanyProfileImage() async {
    try {
      await profileDataSource.deleteCompanyProfileImage();
      return const Right(null);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, void>> addCompanyPhoto(
      AddCompanyPhotoParameters parameters) async {
    try {
      await profileDataSource.addCompanyPhoto(parameters);
      return const Right(null);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCompanyPhoto(
      DeleteCompanyPhotoParameters parameters) async {
    try {
      await profileDataSource.deleteCompanyPhoto(parameters);
      return const Right(null);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }
}
