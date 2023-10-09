import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/domain/parameters/change_password_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_client_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_company_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_company_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_user_parameters.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> loginUser(LoginUserParameters parameters);
  Future<Either<Failure, void>> registerUser(RegisterUserParameters parameters);
  Future<Either<Failure, void>> registerCompany(RegisterCompanyParameters parameters);
  Future<Either<String, String>> changePassword(ChangePasswordParameters parameters);
  Future<Either<Failure, bool>> doesClientEmailExist(DoesClientEmailExistParameters parameters);
  Future<Either<Failure, bool>> doesCompanyEmailExist(DoesCompanyEmailExistParameters parameters);
}
