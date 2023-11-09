import 'package:dawrni/features/auth/data/models/verify_email_code_model.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/verify_email_code_parameters.dart';

import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> register(RegisterParameters parameters);
  Future<UserModel> login(LoginUserParameters parameters);
  Future<VerifyEmailCodeModel> verifyEmailCode(VerifyEmailCodeParameters parameters);
}
