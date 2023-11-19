import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/core/enums/user_type.dart';

class UserEntity extends BaseEntity {
  UserEntity({required this.email, required this.type});

  String email;
  UserType type;

  @override
  List<Object?> get props => [email, type];
}
