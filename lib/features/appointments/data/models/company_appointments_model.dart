import 'package:dawrni/core/enums/company_appointment_status.dart';
import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/appointments/domain/entities/company_appointment_entity.dart';

class CompanyAppointmentsModel extends BaseModel<CompanyAppointmentsEntity> {
  List<CompanyAppointmentModel>? appointments;

  CompanyAppointmentsModel({
    this.appointments,
  });

  CompanyAppointmentsModel.fromJson(dynamic json) {
    appointments =
        (json['results'] as List).map((e) => CompanyAppointmentModel.fromJson(e)).toList();
  }

  @override
  CompanyAppointmentsEntity toEntity() {
    return CompanyAppointmentsEntity(
        appointments: appointments?.map((e) => e.toEntity()).toList() ?? []);
  }
}

class CompanyAppointmentModel extends BaseModel<CompanyAppointmentEntity> {
  CompanyAppointmentModel(
      {this.id,
      this.clientName,
      this.clientImage,
      this.status,
      this.date});

  CompanyAppointmentModel.fromJson(dynamic json) {
    id = json['id'];
    clientName = json['client']['name'];
    clientImage = json['client']['photo'];
    status = CompanyAppointmentStatus.values.byName(json['status'] ?? 'pending');
    date = json['date'];
    time = json['time'];
  }

  int? id;
  String? clientName;
  String? clientImage;
  CompanyAppointmentStatus? status;
  String? date;
  String? time;

  @override
  CompanyAppointmentEntity toEntity() {
    return CompanyAppointmentEntity(
      id: id!,
      clientName: clientName ?? '',
      clientImage: clientImage ?? '',
      status: status ?? CompanyAppointmentStatus.pending,
      date: DateTime.parse("$date $time"),
    );
  }
}
