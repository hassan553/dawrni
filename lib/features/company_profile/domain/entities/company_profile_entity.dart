import 'package:dawrni/core/entities/base_entity.dart';

class CompanyProfileEntity extends BaseEntity{
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? password;
  final String? confirmPassword;
  //final String? Url;


  CompanyProfileEntity(
      {this.name,
      this.password,
      this.confirmPassword,
      this.address,
      this.phoneNumber
      
      });
  @override
  List<Object?> get props =>
      [name, phoneNumber, address, password, confirmPassword];

}