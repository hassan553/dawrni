import 'package:equatable/equatable.dart';

class DoesClientEmailExistParameters extends Equatable {
  final String email;

  const DoesClientEmailExistParameters({
    required this.email
  });

  Map<String, dynamic> toJson() => {
        "email": email,
      };

  @override
  List<Object> get props => [email];
}
