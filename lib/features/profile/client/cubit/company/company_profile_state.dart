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
