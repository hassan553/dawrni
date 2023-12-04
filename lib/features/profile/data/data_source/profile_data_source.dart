import 'package:dawrni/features/profile/data/models/client_profile_model.dart';
import 'package:dawrni/features/profile/data/models/company_profile_model.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';

abstract class ProfileDataSource {
  Future<ClientProfileModel> getClientProfile();
  Future<ClientProfileModel> postUserInfo(
      UserProfileParameters userProfileParameters);
  Future<CompanyProfileModel> getCompanyProfile();
}
