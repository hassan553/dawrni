import 'package:dawrni/features/profile/data/models/company_profile_model.dart';
import 'package:dawrni/features/profile/data/models/user_profile_model.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';

abstract class ProfileDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<UserProfileModel> postUserInfo(
      UserProfileParameters userProfileParameters);
  Future<CompanyProfileModel> getCompanyProfile();
}
