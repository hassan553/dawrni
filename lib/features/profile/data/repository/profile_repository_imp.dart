import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/errors_handler.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/profile/data/data_source/profile_data_source.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';
import 'package:dawrni/features/profile/domain/entities/user_profile_entity.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';
import 'package:dawrni/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final ProfileDataSource profileDataSource;
  ProfileRepositoryImp(this.profileDataSource);
  @override
  Future<Either<Failure, UserProfileEntitiy>> getUserProfile() async {
    return ErrorsHandler.handleEither(() => profileDataSource.getUserProfile());
  }

  @override
  Future<Either<Failure, UserProfileEntitiy>> postUserProfileInfo(
      UserProfileParameters userProfileParameters) {
    return ErrorsHandler.handleEither(
        () => profileDataSource.postUserInfo(userProfileParameters));
  }

  @override
  Future<Either<Failure, CompanyProfileEntity>> getCompanyProfile() {
    return ErrorsHandler.handleEither(() => profileDataSource.getCompanyProfile());
  }
}
