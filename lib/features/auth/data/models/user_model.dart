import 'package:dawrni/core/enums/user_type.dart';
import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';

class UserModel extends BaseModel<UserEntity> {
  UserModel({
    this.userInfo,
    this.token,
    this.isCompany,
  });

  UserModel.fromJson(dynamic json) {
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
    token = json['token'];
    isCompany = json['is_company'];
  }

  UserInfo? userInfo;
  String? token;
  String? isCompany;

  @override
  UserEntity toEntity() {
    return UserEntity(
        username: userInfo!.username!,
        email: userInfo!.email!,
        type: isCompany!.toUserType()!);
  }
}

class UserInfo {
  UserInfo({
    this.username,
    this.email,
  });

  UserInfo.fromJson(dynamic json) {
    username = json['username'];
    email = json['email'];
  }

  String? username;
  String? email;
}
