part of 'companies_bloc.dart';

sealed class CompaniesEvent extends Equatable {
  const CompaniesEvent();
  @override
  List<Object> get props => [];
}

class FetchCompaniesEvent extends CompaniesEvent {
  final bool refresh;
  final String searchQuery;
  final String category;
  const FetchCompaniesEvent({this.refresh = false, this.searchQuery = '', this.category = ''});
}
