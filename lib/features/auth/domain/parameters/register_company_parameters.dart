import 'package:equatable/equatable.dart';

class RegisterCompanyParameters extends Equatable {
  final String name;
  final String email;
  final String password;
  final String license;
  final String category;

  const RegisterCompanyParameters({
    required this.name,
    required this.email,
    required this.password,
    required this.license,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "license": license,
        "category": category,
      };

  @override
  List<Object> get props => [name, email, password, license, category];
}
