part of 'company_profile_cubit.dart';

sealed class CompanyProfileState extends Equatable {
  const CompanyProfileState();

  @override
  List<Object> get props => [];
}

final class CompanyProfileInitial extends CompanyProfileState {}

class GetCompanyProfileLoadingState extends CompanyProfileState {}

class GetCompanyProfileSuccessState extends CompanyProfileState {}

class GetCompanyProfileErrorState extends CompanyProfileState {
  final String error;
  const GetCompanyProfileErrorState(this.error);
}

class UpdateCompanyProfileImageSuccessState extends CompanyProfileState {}

class UpdateCompanyProfileImageErrorState extends CompanyProfileState {}

class UpdateCompanyProfileNameSuccessState extends CompanyProfileState {}

class NotValidEmptyValueState extends CompanyProfileState {}

class UpdateCompanyProfileDescriptionSuccessState extends CompanyProfileState {}
class NoInternetState extends CompanyProfileState {}


class ChangePasswordLoadingState extends CompanyProfileState {}

class ChangePasswordSuccessState extends CompanyProfileState {}

class ChangePasswordErrorState extends CompanyProfileState {}
