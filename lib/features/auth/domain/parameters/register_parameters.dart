import 'package:dawrni/core/enums/user_type.dart';
import 'package:equatable/equatable.dart';

class RegisterParameters extends Equatable {
  final String username;
  final String password;
  final String email;
  final UserType type;

  const RegisterParameters(
      {required this.username,
        required this.password,
        required this.email,
        required this.type});

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "is_company": type.toParameter(),
  };

  @override
  List<Object> get props =>
      [username, password, email, type];
}
