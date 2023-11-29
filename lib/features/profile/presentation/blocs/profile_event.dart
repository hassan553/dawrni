part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class GetUserProfileEvent extends ProfileEvent {
  const GetUserProfileEvent();
}

class PostUserProfileEvent extends ProfileEvent {
  String? name;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  String? address;
  PostUserProfileEvent({
    this.name,
    this.phoneNumber,
    this.address,
    this.password,
    this.confirmPassword,
  });



  

  @override
  List<Object?> get props =>
      [name, phoneNumber, password, confirmPassword, address];
}
