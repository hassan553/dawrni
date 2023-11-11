import 'package:equatable/equatable.dart';

class VerifyEmailCodeParameters extends Equatable {
  final String email;
  final String code;

  const VerifyEmailCodeParameters({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "code_name": code,
      };

  @override
  List<Object> get props => [email, code];
}
