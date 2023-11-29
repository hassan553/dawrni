import 'package:dawrni/core/constants/apis_urls.dart';
import 'package:dawrni/core/services/api_services.dart';
import 'package:dawrni/core/utils/app_response.dart';
import 'package:dawrni/features/profile/data/data_source/profile_data_source.dart';
import 'package:dawrni/features/profile/data/models/user_profile_model.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';
import 'package:dio/dio.dart';

// TODO: add urls and implemente post and get methods
class ProfileRemoteDataSourceImp extends ProfileDataSource {
  @override
  Future<UserProfileModel> getUserProfile() async {
    AppResponse appResponse = await ApiServices().get(ApisUrls.getUserProfiel);
    return UserProfileModel.fromJson(appResponse.data);
  }

  @override
  Future<UserProfileModel> postUserInfo(
      UserProfileParameters userProfileParameters) async {
    AppResponse appResponse = await ApiServices().post(
        ApisUrls.postUserProfielInfo,
        data: userProfileParameters.toJson());
    return UserProfileModel.fromJson(appResponse.data);
  }
}
