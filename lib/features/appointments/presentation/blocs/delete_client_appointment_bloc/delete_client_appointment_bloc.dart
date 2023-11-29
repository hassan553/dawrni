import 'dart:async';
import 'package:dawrni/features/appointments/domain/parameters/delete_client_appointment_parameters.dart';
import 'package:dawrni/features/appointments/domain/repository/appointments_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'delete_client_appointment_event.dart';

class DeleteClientAppointmentBloc
    extends Bloc<DeleteClientAppointmentEvent, BaseState<void>> {
  final AppointmentsRepository appointmentsRepository;

  DeleteClientAppointmentBloc(this.appointmentsRepository)
      : super(const BaseState<void>()) {
    on<DeleteClientAppointmentButtonPressedEvent>(_deleteClientAppointment);
  }

  FutureOr<void> _deleteClientAppointment(
      DeleteClientAppointmentButtonPressedEvent event, emit) async {
    emit(state.loading());
    final result = await appointmentsRepository.deleteClientAppointment(
        DeleteClientAppointmentParameters(id: event.id));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
