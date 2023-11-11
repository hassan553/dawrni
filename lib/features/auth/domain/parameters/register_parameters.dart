import 'package:dawrni/core/enums/user_type.dart';
import 'package:equatable/equatable.dart';

class RegisterParameters extends Equatable {
  final String email;
  final String password;
  final UserType type;

  const RegisterParameters(
      {required this.email,
        required this.password,
        required this.type});

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "user_type": type.toParameter(),
  };

  @override
  List<Object> get props =>
      [password, email, type];
}
