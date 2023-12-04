part of 'company_appointments_bloc.dart';

sealed class CompanyAppointmentsEvent extends Equatable {
  const CompanyAppointmentsEvent();
  @override
  List<Object> get props => [];
}

class FetchCompanyAppointmentsEvent extends CompanyAppointmentsEvent {
  final bool refresh;
  const FetchCompanyAppointmentsEvent({this.refresh = false});

  @override
  List<Object> get props => [refresh];
}
