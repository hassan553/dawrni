import 'package:equatable/equatable.dart';

class DoesCompanyEmailExistParameters extends Equatable {
  final String email;

  const DoesCompanyEmailExistParameters({
    required this.email
  });

  Map<String, dynamic> toJson() => {
        "email": email
      };

  @override
  List<Object> get props => [email];
}
