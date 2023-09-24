import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawrni/features/auth/data/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo repo;
  AuthCubit(this.repo) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  Future userLogin(String email, String password) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      emit(ClientLoginLoadingState());
      var result = await repo.loginUser(email, password);
      result.fold((l) {
        emit(ClientLoginErrorState(l));
      }, (r) {
        emit(ClientLoginSuccessState(r));
      });
    } else {
      emit(NoInternetConnection());
    }
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
