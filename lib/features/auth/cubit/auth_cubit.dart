import 'package:bloc/bloc.dart';
import 'package:dawrni/features/auth/data/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/contants/constants.dart';
import '../../../main.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo repo;
  AuthCubit(this.repo) : super(AuthInitial());
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

    if (_result == true) {
      final result = await repo.changePassword(email);
      result.fold((l) {
        emit(ChangePasswordErrorState());
      }, (r) {
        emit(ChangePasswordSuccessState());
      });
    } else {
      emit(NoInternetConnection());
    }
  }

  Future userLogin(String email, String password) async {
    bool isCompany = sharedPreferences.getBool(kIsCompany) ?? false;
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      emit(ClientLoginLoadingState());
      if (isCompany) {
        final response = await repo.doesClientEmailExist(email);
        if (response) {
          emit(AccountExistState("Company Email"));
        } else {
          loginMethod(email, password);
        }
      } else {
        final result = await repo.doesCompanyEmailExist(email);
        if (result) {
          emit(AccountExistState("Client Email"));
        } else {
          loginMethod(email, password);
        }
      }
    } else {
      emit(NoInternetConnection());
    }
  }

  loginMethod(String email, String password) async {
    var result = await repo.loginUser(email, password);
    result.fold((l) {
      emit(ClientLoginErrorState(l));
    }, (r) {
      emit(ClientLoginSuccessState(r));
    });
  }

  Future userRegister(String name, String email, String password) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      emit(ClientRegisterLoadingState());
      var result = await repo.registerClient(name, email, password);
      result.fold((l) {
        emit(ClientRegisterErrorState(l));
      }, (r) {
        emit(ClientRegisterSuccessState(r));
      });
    } else {
      emit(NoInternetConnection());
    }
  }

  Future companyRegister({
    required String name,
    required String email,
    required String password,
    required String category,
    required String license,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      emit(CompanyRegisterLoadingState());
      var result = await repo.registerCompany(
        password: password,
        category: category,
        email: email,
        license: license,
        name: name,
      );
      result.fold((l) {
        emit(CompanyRegisterErrorState(l));
      }, (r) {
        emit(CompanyRegisterSuccessState(r));
      });
    } else {
      emit(NoInternetConnection());
    }
  }
}
