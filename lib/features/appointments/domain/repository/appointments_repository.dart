import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/appointments/domain/entities/client_appointment_entity.dart';
import 'package:dawrni/features/appointments/domain/parameters/get_client_appointments_parameters.dart';


abstract class AppointmentsRepository {
  Future<Either<Failure, ClientAppointmentsEntity>> getClientAppointments(GetClientAppointmentsParameters parameters);
}
