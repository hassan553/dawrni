import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/core/enums/user_type.dart';

class UserEntity extends BaseEntity {
  UserEntity({required this.email, required this.type, required this.isVerified, required this.token});

  String email;
  UserType type;
  bool isVerified;
  String token;

  @override
  List<Object?> get props => [email, type, isVerified, token];
}
