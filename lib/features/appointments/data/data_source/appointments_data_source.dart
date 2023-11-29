import 'package:dawrni/features/appointments/data/models/client_appointments_model.dart';
import 'package:dawrni/features/appointments/domain/parameters/delete_client_appointment_parameters.dart';
import 'package:dawrni/features/appointments/domain/parameters/get_client_appointments_parameters.dart';

abstract class AppointmentsDataSource {
  Future<ClientAppointmentsModel> getClientAppointments(GetClientAppointmentsParameters parameters);
  Future<void> deleteClientAppointment(DeleteClientAppointmentParameters parameters);
}