import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/profile/domain/entities/user_profile_entity.dart';

class UserProfileModel extends BaseModel<UserProfileEntitiy> {
  // final String id;
  String? name;
  String? phoneNumber;
  String? address;
  String? password;
  String? confirmPassword;
  UserProfileModel(
      {
      //required this.id,
      this.name,
      this.address,
      this.phoneNumber,
      this.password,
      this.confirmPassword});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        address: json['address'],
        password: json['password'],
        confirmPassword: json['confirmPassword']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    return map;
  }

  @override
  UserProfileEntitiy toEntity() {
    return UserProfileEntitiy(
        name: name, address: address, phoneNumber: phoneNumber);
  }
}
