import 'package:dawrni/features/profile/data/models/client_profile_model.dart';
import 'package:dawrni/features/profile/data/models/company_profile_model.dart';
import 'package:dawrni/features/profile/domain/parameters/add_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/delete_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_client_profile_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_company_profile_parameters.dart';

abstract class ProfileDataSource {
  Future<ClientProfileModel> getClientProfile();
  Future<void> updateClientProfile(UpdateClientProfileParameters parameters);
  Future<void> deleteClientProfileImage();
  Future<CompanyProfileModel> getCompanyProfile();
  Future<void> updateCompanyProfile(UpdateCompanyProfileParameters parameters);
  Future<void> deleteCompanyProfileImage();
  Future<void> addCompanyPhoto(AddCompanyPhotoParameters parameters);
  Future<void> deleteCompanyPhoto(DeleteCompanyPhotoParameters parameters);
}
