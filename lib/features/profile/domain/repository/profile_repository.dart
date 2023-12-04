import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ClientProfileEntity>> getClientProfile();
  Future<Either<Failure, ClientProfileEntity>> postUserProfileInfo(
      UserProfileParameters userProfileParameters);
  Future<Either<Failure, CompanyProfileEntity>> getCompanyProfile();
}
