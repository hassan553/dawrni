import 'package:dartz/dartz.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/features/auth/data/models/user_model.dart';
import 'package:dawrni/features/auth/data/models/verify_email_code_model.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/domain/entities/verify_email_code_entity.dart';
import 'package:dawrni/features/auth/domain/parameters/change_password_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_client_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_company_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_company_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/verify_email_code_parameters.dart';

import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_data_source.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImp(this.authDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(
      RegisterParameters parameters) async {
    try {
      final UserModel res = await authDataSource.register(parameters);
      final user = res.toEntity();
      // await CacheStorageServices().setToken(res.token!);
      return Right(user);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      LoginUserParameters parameters) async {
    try {
      final UserModel res = await authDataSource.login(parameters);
      final user = res.toEntity();
      // await CacheStorageServices().setToken(res.token??'');
      return Right(user);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, VerifyEmailCodeEntity>> verifyEmailCode(
      VerifyEmailCodeParameters parameters) async {
    try {
      final VerifyEmailCodeModel response =
          await authDataSource.verifyEmailCode(parameters);
      return Right(response.toEntity());
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }
}
