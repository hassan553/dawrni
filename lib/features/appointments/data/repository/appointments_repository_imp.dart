import 'package:dartz/dartz.dart';
import 'package:dawrni/features/appointments/data/data_source/appointments_data_source.dart';
import 'package:dawrni/features/appointments/domain/entities/client_appointment_entity.dart';
import 'package:dawrni/features/appointments/domain/parameters/delete_client_appointment_parameters.dart';
import 'package:dawrni/features/appointments/domain/parameters/get_client_appointments_parameters.dart';
import 'package:dawrni/features/appointments/domain/repository/appointments_repository.dart';

import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';

class AppointmentsRepositoryImp extends AppointmentsRepository {
  final AppointmentsDataSource appointmentsDataSource;

  AppointmentsRepositoryImp(this.appointmentsDataSource);

  @override
  Future<Either<Failure, ClientAppointmentsEntity>> getClientAppointments(
      GetClientAppointmentsParameters parameters) {
    return ErrorsHandler.handleEither(
        () => appointmentsDataSource.getClientAppointments(parameters));
  }

  @override
  Future<Either<Failure, void>> deleteClientAppointment(DeleteClientAppointmentParameters parameters) async {
    try {
      await appointmentsDataSource.deleteClientAppointment(parameters);
      return const Right(null);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }
}
