import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/core/enums/company_appointment_status.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';

class CompanyAppointmentsEntity extends BaseEntity {
  final List<CompanyAppointmentEntity> appointments;

  CompanyAppointmentsEntity({required this.appointments});

  @override
  List<Object?> get props => [appointments];
}

class CompanyAppointmentEntity extends BaseEntity {
  CompanyAppointmentEntity({
    required this.id,
    required this.clientName,
    required this.clientImage,
    required this.status,
    required this.date,
  });

  final int id;
  final String clientName;
  final String clientImage;
  final CompanyAppointmentStatus status;
  final DateTime date;

  @override
  List<Object?> get props =>
      [id, clientName, clientImage, status, date];
}
