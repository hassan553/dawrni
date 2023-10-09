import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/features/auth/domain/parameters/does_client_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_company_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_company_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_user_parameters.dart';
import 'package:dawrni/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  cancelState() {
    emit(CancelState());
  }

  checkVerifictionEmail() {
    bool? result = FirebaseAuth.instance.currentUser!.emailVerified;
    if (result == false) {
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
    }
    return result;
  }

  bool obscure = true;

  void changePasswordObscure() {
    obscure = !obscure;
    emit(ChangePasswordObscureState());
  }

  void changePassword(String email) async {
    emit(ChangePasswordLoadingState());
    bool _result = await InternetConnectionChecker().hasConnection;

    // if (_result == true) {
    //   final result = await repo.changePassword(email);
    //   result.fold((l) {
    //     emit(ChangePasswordErrorState());
    //   }, (r) {
    //     emit(ChangePasswordSuccessState());
    //   });
    // } else {
    //   emit(NoInternetConnection());
    // }
  }

  Future userLogin(String email, String password) async {
    emit(ClientLoginLoadingState());
    bool isCompany = CacheStorageServices().isCompany;
    if (isCompany) {
      final result = await authRepository
          .doesClientEmailExist(DoesClientEmailExistParameters(email: email));
      result.fold(
          (l) => emit(ClientLoginErrorState(l.message)),
          (r) => r
              ? emit(AccountExistState("Company Email"))
              : loginMethod(email, password));
    } else {
      final result = await authRepository
          .doesCompanyEmailExist(DoesCompanyEmailExistParameters(email: email));
      result.fold(
          (l) => emit(ClientLoginErrorState(l.message)),
          (r) => r
              ? emit(AccountExistState("Client Email"))
              : loginMethod(email, password));
    }
  }

  loginMethod(String email, String password) async {
    final result = await authRepository
        .loginUser(LoginUserParameters(email: email, password: password));
    result.fold((l) {
      emit(ClientLoginErrorState(l.message));
    }, (r) {
      emit(ClientLoginSuccessState('Successfully Login'));
    });
  }

  Future userRegister(String name, String email, String password) async {
    emit(ClientRegisterLoadingState());
    var result = await authRepository.registerUser(
        RegisterUserParameters(name: name, email: email, password: password));
    result.fold((l) {
      emit(ClientRegisterErrorState(l.message));
    }, (r) {
      emit(ClientRegisterSuccessState('Success Create Account'));
    });
  }

  Future companyRegister({
    required String name,
    required String email,
    required String password,
    required String category,
    required String license,
  }) async {
    emit(CompanyRegisterLoadingState());
    var result = await authRepository.registerCompany(RegisterCompanyParameters(
        name: name,
        email: email,
        password: password,
        license: license,
        category: category));
    result.fold((l) {
      emit(CompanyRegisterErrorState(l.message));
    }, (r) {
      emit(CompanyRegisterSuccessState("Success Create Account"));
    });
  }
}
