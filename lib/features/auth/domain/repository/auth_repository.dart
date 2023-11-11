import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/domain/entities/verify_email_code_entity.dart';
import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/verify_email_code_parameters.dart';

import '../parameters/login_user_parameters.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterParameters parameters);
  Future<Either<Failure, UserEntity>> login(LoginUserParameters parameters);
  Future<Either<Failure, VerifyEmailCodeEntity>> verifyEmailCode(VerifyEmailCodeParameters parameters);
}
