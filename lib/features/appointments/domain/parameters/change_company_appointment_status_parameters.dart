import 'package:dawrni/core/enums/company_appointment_status.dart';
import 'package:equatable/equatable.dart';

class ChangeCompanyAppointmentStatusParameters extends Equatable {
  final int id;
  final CompanyAppointmentStatus status;

  const ChangeCompanyAppointmentStatusParameters(
      {required this.id, required this.status});

  Map<String, dynamic> toJson() => {"status": status.type};

  String toQueryParameters() => "$id";

  @override
  List<Object?> get props => [id, status];
}
