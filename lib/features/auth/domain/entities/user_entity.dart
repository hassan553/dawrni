import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String? email;
  final bool isAdmin;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      isAdmin,
    ];
  }
}
