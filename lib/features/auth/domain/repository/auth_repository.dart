import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterParameters parameters);
}
