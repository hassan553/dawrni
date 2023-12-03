part of 'company_profile_bloc.dart';

sealed class CompanyProfileEvent extends Equatable {
  const CompanyProfileEvent();
  @override
  List<Object> get props => [];
}

class FetchCompanyProfileEvent extends CompanyProfileEvent {
  const FetchCompanyProfileEvent();
}
