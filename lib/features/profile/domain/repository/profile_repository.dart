import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/profile/domain/entities/user_profile_entity.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileEntitiy>> getUserProfile();
  Future<Either<Failure, UserProfileEntitiy>> postUserProfileInfo(
      UserProfileParameters userProfileParameters);
}
