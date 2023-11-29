part of 'client_appointments_bloc.dart';

sealed class ClientAppointmentsEvent extends Equatable {
  const ClientAppointmentsEvent();
  @override
  List<Object> get props => [];
}

class FetchClientAppointmentsEvent extends ClientAppointmentsEvent {
  final bool refresh;
  const FetchClientAppointmentsEvent({this.refresh = false});

  @override
  List<Object> get props => [refresh];
}
