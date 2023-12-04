import 'package:dawrni/core/enums/user_type.dart';
import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';

class UserModel extends BaseModel<UserEntity> {
  UserModel({
      this.userInfo, 
      this.token,});

  UserModel.fromJson(dynamic json) {
    userInfo = json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : json['user'] != null ? UserInfo.fromJson(json['user']) : null;
    token = json['token'];
  }
  UserInfo? userInfo;
  String? token;

  @override
  UserEntity toEntity() {
    return UserEntity(
        email: userInfo!.email!,
        type: userInfo!.userType!.toUserType()!,
    isVerified: userInfo!.isVerified ?? true,
    token: token ?? '');
  }

}

class UserInfo {
  UserInfo({
      this.email, 
      this.userType,
  this.isVerified});

  UserInfo.fromJson(dynamic json) {
    email = json['email'];
    userType = json['user_type'];
    isVerified = json['is_verified'];
  }
  String? email;
  String? userType;
  bool? isVerified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['user_type'] = userType;
    map['is_verified'] = isVerified;
    return map;
  }

}