import 'package:dawrni/features/auth/domain/parameters/change_password_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_client_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_company_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_company_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_user_parameters.dart';

import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<void> loginUser(LoginUserParameters parameters);
  Future<void> registerUser(RegisterUserParameters parameters);
  Future<void> registerCompany(RegisterCompanyParameters parameters);
  Future<UserModel> changePassword(ChangePasswordParameters parameters);
  Future<bool> doesClientEmailExist(DoesClientEmailExistParameters email);
  Future<bool> doesCompanyEmailExist(DoesCompanyEmailExistParameters email);
}
