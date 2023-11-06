import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';

import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> register(RegisterParameters parameters);
}
