import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';

import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> register(RegisterParameters parameters);
  Future<UserModel> login(LoginUserParameters parameters);
}
