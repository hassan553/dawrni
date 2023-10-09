import 'package:dartz/dartz.dart';
import 'package:dawrni/features/auth/domain/parameters/change_password_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_client_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_company_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_company_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_user_parameters.dart';

import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_data_source.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImp(this.authDataSource);

  @override
  Future<Either<Failure, void>> loginUser(LoginUserParameters parameters) {
    return ErrorsHandler.handleEither(
        () => authDataSource.loginUser(parameters));
  }

  @override
  Future<Either<Failure, void>> registerUser(
      RegisterUserParameters parameters) {
    return ErrorsHandler.handleEither(
        () => authDataSource.registerUser(parameters));
  }

  @override
  Future<Either<Failure, void>> registerCompany(
      RegisterCompanyParameters parameters) {
    return ErrorsHandler.handleEither(
            () => authDataSource.registerCompany(parameters));
  }

  @override
  Future<Either<String, String>> changePassword(
      ChangePasswordParameters parameters) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> doesClientEmailExist(
      DoesClientEmailExistParameters parameters) {
    return ErrorsHandler.handleEither(
        () => authDataSource.doesClientEmailExist(parameters));
  }

  @override
  Future<Either<Failure, bool>> doesCompanyEmailExist(
      DoesCompanyEmailExistParameters parameters) {
    return ErrorsHandler.handleEither(
        () => authDataSource.doesCompanyEmailExist(parameters));
  }
}
