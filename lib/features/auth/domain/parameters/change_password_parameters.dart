import 'package:equatable/equatable.dart';

class ChangePasswordParameters extends Equatable {
  final String email;

  const ChangePasswordParameters({
    required this.email
  });

  Map<String, dynamic> toJson() => {
        "email": email
      };

  @override
  List<Object> get props => [email];
}
