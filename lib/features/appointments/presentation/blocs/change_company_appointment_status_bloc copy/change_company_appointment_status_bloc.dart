import 'dart:async';
import 'package:dawrni/core/enums/company_appointment_status.dart';
import 'package:dawrni/features/appointments/domain/parameters/change_company_appointment_status_parameters.dart';
import 'package:dawrni/features/appointments/domain/repository/appointments_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';

part 'change_company_appointment_status_event.dart';

class ChangeCompanyAppointmentStatusBloc
    extends Bloc<ChangeCompanyAppointmentStatusEvent, BaseState<void>> {
  final AppointmentsRepository appointmentsRepository;

  ChangeCompanyAppointmentStatusBloc(this.appointmentsRepository)
      : super(const BaseState<void>()) {
    on<ChangeCompanyAppointmentStatusButtonPressedEvent>(
        _changeCompanyAppointmentStatus);
  }

  FutureOr<void> _changeCompanyAppointmentStatus(
      ChangeCompanyAppointmentStatusButtonPressedEvent event, emit) async {
    emit(state.loading());
    final result = await appointmentsRepository.changeCompanyAppointmentStatus(
        ChangeCompanyAppointmentStatusParameters(
            id: event.id, status: event.status));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
