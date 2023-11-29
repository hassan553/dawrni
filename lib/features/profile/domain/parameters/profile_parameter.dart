import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserProfileParameters extends Equatable {
  String? name;
  String? password;
  String? confirmPassword;
  String? address;
  String? phoneNumber;

  UserProfileParameters({
    this.name,
    this.phoneNumber,
    this.address,
    this.password,
    this.confirmPassword,
  });

  Object? toJson() => jsonEncode({
        "name": name,
        "phoneNumber": phoneNumber,
        "address": address,
        "password": password,
        "confirmPassword": confirmPassword,
      });

  @override
  List<Object?> get props =>
      [name, phoneNumber, address, password, confirmPassword];
}
