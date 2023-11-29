part of 'delete_client_appointment_bloc.dart';

sealed class DeleteClientAppointmentEvent extends Equatable {
  const DeleteClientAppointmentEvent();
  @override
  List<Object> get props => [];
}

class DeleteClientAppointmentButtonPressedEvent extends DeleteClientAppointmentEvent {
  final int id;
  const DeleteClientAppointmentButtonPressedEvent({required this.id});

  @override
  List<Object> get props => [id];
}
