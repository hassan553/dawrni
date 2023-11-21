part of 'company_details_bloc.dart';

sealed class CompanyDetailsEvent extends Equatable {
  const CompanyDetailsEvent();
  @override
  List<Object> get props => [];
}

class FetchCompanyDetailsEvent extends CompanyDetailsEvent {
  final String id;
  const FetchCompanyDetailsEvent({required this.id});
}
