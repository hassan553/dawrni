import 'package:equatable/equatable.dart';

class LoginUserParameters extends Equatable {
  final String email;
  final String password;

  const LoginUserParameters({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  @override
  List<Object> get props => [email, password];
}
