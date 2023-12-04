import 'package:dawrni/core/constants/apis_urls.dart';
import 'package:dawrni/core/services/api_services.dart';
import 'package:dawrni/core/utils/app_response.dart';
import 'package:dawrni/features/appointments/data/data_source/appointments_data_source.dart';
import 'package:dawrni/features/appointments/data/models/client_appointments_model.dart';
import 'package:dawrni/features/appointments/data/models/company_appointments_model.dart';
import 'package:dawrni/features/appointments/domain/parameters/delete_client_appointment_parameters.dart';
import 'package:dawrni/features/appointments/domain/parameters/get_client_appointments_parameters.dart';
import 'package:dawrni/features/appointments/domain/parameters/get_company_appointments_parameters.dart';

class AppointmentsRemoteDataSourceImp extends AppointmentsDataSource {
  @override
  Future<ClientAppointmentsModel> getClientAppointments(GetClientAppointmentsParameters parameters) async {
    AppResponse response = await ApiServices()
        .get(ApisUrls.getClientAppointments(parameters.toQueryParameters()));
    return ClientAppointmentsModel.fromJson(response.data);
    // await Future.delayed(const Duration(seconds: 2));
    // return ClientAppointmentsModel(
    //   appointments: [
    //     ClientAppointmentModel(id: 1, categoryId: 1, checked: true, companyImage: "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg", companyName: "Al Hikma company service", date: DateTime.now()),
    //     ClientAppointmentModel(id: 2, categoryId: 2, checked: false, companyImage: "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg", companyName: "High Tech Company service", date: DateTime.now()),
    //     ClientAppointmentModel(id: 3, categoryId: 3, checked: true, companyImage: "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg", companyName: "Al Hussein company service", date: DateTime.now()),
    //   ]
    // );
  }

  @override
  Future<void> deleteClientAppointment(DeleteClientAppointmentParameters parameters) async {
    await ApiServices().delete(ApisUrls.deleteClientAppointment(parameters.toQueryParameters()));
    // await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<CompanyAppointmentsModel> getCompanyAppointments(GetCompanyAppointmentsParameters parameters) async {
    AppResponse response = await ApiServices()
        .get(ApisUrls.getCompanyAppointments(parameters.toQueryParameters()));
    return CompanyAppointmentsModel.fromJson(response.data);
  }
}
