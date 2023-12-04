import 'dart:async';
import 'package:dawrni/features/appointments/domain/entities/company_appointment_entity.dart';
import 'package:dawrni/features/appointments/domain/parameters/get_company_appointments_parameters.dart';
import 'package:dawrni/features/appointments/domain/repository/appointments_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/base_state.dart';

part 'company_appointments_event.dart';

class CompanyAppointmentsBloc extends Bloc<CompanyAppointmentsEvent, BaseState<CompanyAppointmentsEntity>> {
  final AppointmentsRepository appointmentsRepository;

  CompanyAppointmentsBloc(this.appointmentsRepository)
      : super(const BaseState<CompanyAppointmentsEntity>()) {
    on<FetchCompanyAppointmentsEvent>(_getCompanyAppointments);
  }

  int _page = 0;
  final int _length = 10;
  bool enablePullUp = true;
  List<CompanyAppointmentEntity> _appointments = [];
  final RefreshController refreshController = RefreshController();

  FutureOr<void> _getCompanyAppointments(FetchCompanyAppointmentsEvent event, emit) async {
    if (event.refresh) {
      _page = 0;
      enablePullUp = true;
      _appointments = [];
    }
    if(_page == 0) emit(state.loading());
    final result = await appointmentsRepository
        .getCompanyAppointments(GetCompanyAppointmentsParameters(
      offset:  _page * _length,
      limit: _length
    ));
    result.fold((l) => emit(state.error(l)), (r) {
      _page++;
      if(r.appointments.isEmpty || r.appointments.length < _length) {
        enablePullUp = false;
      }
      _appointments = _appointments + r.appointments;
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      return emit(state.success(CompanyAppointmentsEntity(appointments: _appointments), enablePullUp: enablePullUp));
    });
  }
}
