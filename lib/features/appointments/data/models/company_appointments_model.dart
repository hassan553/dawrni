import 'package:dawrni/core/constants/app_constants.dart';
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
      this.companyName,
      this.companyImage,
      this.categoryId,
      this.checked,
      this.date});

  CompanyAppointmentModel.fromJson(dynamic json) {
    id = json['id'];
    companyName = json['company']['name'];
    companyImage = json['company']['image'];
    categoryId = json['company']['category_id'];
    ///todo: fix this
    checked = json['status'] != 'pending';
    date = json['date'];
    time = json['time'];
  }

  int? id;
  String? companyName;
  String? companyImage;
  int? categoryId;
  bool? checked;
  String? date;
  String? time;

  @override
  CompanyAppointmentEntity toEntity() {
    return CompanyAppointmentEntity(
      id: id!,
      companyName: companyName ?? '',
      companyImage: companyImage ?? '',
      companyCategory:
          ///todo: remove orElse
          AppConstants.categories.firstWhere((element) => element.id == categoryId, orElse: () => AppConstants.categories.first),
      checked: checked ?? false,
      date: DateTime.parse("$date $time"),
    );
  }
}
