import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';

class ClientAppointmentsEntity extends BaseEntity {
  final List<ClientAppointmentEntity> appointments;

  ClientAppointmentsEntity({required this.appointments});

  @override
  List<Object?> get props => [appointments];
}

class ClientAppointmentEntity extends BaseEntity {
  ClientAppointmentEntity({
    required this.id,
    required this.companyName,
    required this.companyImage,
    required this.companyCategory,
    required this.checked,
    required this.date,
  });

  final int id;
  final String companyName;
  final String companyImage;
  final CategoryEntity companyCategory;
  final bool checked;
  final DateTime date;

  @override
  List<Object?> get props =>
      [id, companyName, companyImage, companyCategory, checked, date];
}
