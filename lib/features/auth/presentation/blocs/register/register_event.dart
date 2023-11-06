part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonTappedEvent extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final UserType type;

  const RegisterButtonTappedEvent(
      {required this.username,
      required this.email,
      required this.password,
      required this.type});

  @override
  List<Object> get props => [username, email, password, type];
}
