part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class ClientLoginLoadingState extends AuthState {}

class ClientLoginSuccessState extends AuthState {
  final String user;
  ClientLoginSuccessState(this.user);
}

class ClientLoginErrorState extends AuthState {
  final String error;
  ClientLoginErrorState(this.error);
}

class NoInternetConnection extends AuthState {}

class ClientRegisterLoadingState extends AuthState {}

class ClientRegisterSuccessState extends AuthState {
  final String user;
  ClientRegisterSuccessState(this.user);
}

class ClientRegisterErrorState extends AuthState {
  final String error;
  ClientRegisterErrorState(this.error);
}

class CompanyRegisterLoadingState extends AuthState {}

class CompanyRegisterSuccessState extends AuthState {
  final String user;
  CompanyRegisterSuccessState(this.user);
}

class CompanyRegisterErrorState extends AuthState {
  final String error;
  CompanyRegisterErrorState(this.error);
}
