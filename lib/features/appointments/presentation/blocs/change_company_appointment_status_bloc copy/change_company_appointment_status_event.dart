part of 'change_company_appointment_status_bloc.dart';

sealed class ChangeCompanyAppointmentStatusEvent extends Equatable {
  const ChangeCompanyAppointmentStatusEvent();
  @override
  List<Object> get props => [];
}

class ChangeCompanyAppointmentStatusButtonPressedEvent
    extends ChangeCompanyAppointmentStatusEvent {
  final int id;
  final CompanyAppointmentStatus status;
  const ChangeCompanyAppointmentStatusButtonPressedEvent(
      {required this.id, required this.status});

  @override
  List<Object> get props => [id, status];
}
