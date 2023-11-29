import 'package:dawrni/core/constants/app_constants.dart';
import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/appointments/domain/entities/client_appointment_entity.dart';

class ClientAppointmentsModel extends BaseModel<ClientAppointmentsEntity> {
  List<ClientAppointmentModel>? appointments;

  ClientAppointmentsModel({
    this.appointments,
  });

  ClientAppointmentsModel.fromJson(dynamic json) {
    appointments =
        (json as List).map((e) => ClientAppointmentModel.fromJson(e)).toList();
  }

  @override
  ClientAppointmentsEntity toEntity() {
    return ClientAppointmentsEntity(
        appointments: appointments?.map((e) => e.toEntity()).toList() ?? []);
  }
}

class ClientAppointmentModel extends BaseModel<ClientAppointmentEntity> {
  ClientAppointmentModel(
      {this.id,
      this.companyName,
      this.companyImage,
      this.categoryId,
      this.checked,
      this.date});

  ClientAppointmentModel.fromJson(dynamic json) {
    id = json['id'];
    companyName = json['company_name'];
    companyImage = json['company_image'];
    categoryId = json['category_id'];
    checked = json['checked'];
    date = json['date'];
  }

  int? id;
  String? companyName;
  String? companyImage;
  int? categoryId;
  bool? checked;
  DateTime? date;

  @override
  ClientAppointmentEntity toEntity() {
    return ClientAppointmentEntity(
      id: id!,
      companyName: companyName ?? '',
      companyImage: companyImage ?? '',
      companyCategory:
          AppConstants.categories.firstWhere((element) => element.id == id),
      checked: checked ?? false,
      date: date!,
    );
  }
}
