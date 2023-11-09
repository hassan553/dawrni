import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawrni/core/constants/apis_urls.dart';
import 'package:dawrni/core/services/api_services.dart';
import 'package:dawrni/core/utils/app_response.dart';
import 'package:dawrni/features/auth/data/models/verify_email_code_model.dart';
import 'package:dawrni/features/auth/domain/parameters/change_password_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_client_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_company_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_company_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/verify_email_code_parameters.dart';
import 'package:dawrni/features/profile/data/model/company_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import 'auth_data_source.dart';

class AuthRemoteDataSourceImp extends AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore store;

  AuthRemoteDataSourceImp({required this.auth, required this.store});

  @override
  Future<UserModel> register(RegisterParameters parameters) async {
    AppResponse response = await ApiServices().post(
      ApisUrls.register,
      data: parameters.toJson(),
    );
    return UserModel.fromJson(response.data);
  }
   @override
  Future<UserModel> login(LoginUserParameters parameters) async {
    AppResponse response = await ApiServices().post(
      ApisUrls.login,
      data: parameters.toJson(),
    );
    return UserModel.fromJson(response.data);
  }

  @override
  Future<VerifyEmailCodeModel> verifyEmailCode(VerifyEmailCodeParameters parameters)async {
  AppResponse response = await ApiServices().post(
      ApisUrls.verifyEmailCode,
      data: parameters.toJson(),
    );
    return VerifyEmailCodeModel.fromJson(response.data);
  }
}
