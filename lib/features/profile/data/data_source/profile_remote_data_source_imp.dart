import 'package:dawrni/core/constants/apis_urls.dart';
import 'package:dawrni/core/services/api_services.dart';
import 'package:dawrni/core/utils/app_response.dart';
import 'package:dawrni/features/profile/data/data_source/profile_data_source.dart';
import 'package:dawrni/features/profile/data/models/client_profile_model.dart';
import 'package:dawrni/features/profile/data/models/company_profile_model.dart';
import 'package:dawrni/features/profile/domain/parameters/add_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/delete_company_photo_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_client_profile_parameters.dart';
import 'package:dawrni/features/profile/domain/parameters/update_company_profile_parameters.dart';

// TODO: add urls and implemente post and get methods
class ProfileRemoteDataSourceImp extends ProfileDataSource {
  @override
  Future<ClientProfileModel> getClientProfile() async {
    AppResponse appResponse = await ApiServices().get(ApisUrls.getProfile);
    return ClientProfileModel.fromJson(appResponse.data);
  }

  @override
  Future<CompanyProfileModel> getCompanyProfile() async {
    AppResponse appResponse = await ApiServices().get(ApisUrls.getProfile);
    return CompanyProfileModel.fromJson(appResponse.data);
    // await Future.delayed(const Duration(seconds: 2));
    // return CompanyProfileModel(
    //     nameEn: 'Abdullah Otaibi',
    //     nameAr: 'عبدالله العتيبي',
    //     aboutEn: "about En " * 10,
    //     aboutAr: "حول التطبيق" * 10,
    //     addressEn: "This is address",
    //     addressAr: "هذا هو العنوان",
    //     imageUrl:
    //         "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    //     photos: [
    //       "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    //       "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    //       "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
    //       "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    //       "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
    //       "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
    //     ],
    //     lat: 33,
    //     lng: 30,
    //     categoryId: 1);
  }

  @override
  Future<void> updateCompanyProfile(
      UpdateCompanyProfileParameters parameters) async {
    await ApiServices()
        .put(ApisUrls.updateCompanyProfile, data: await parameters.toJson());
  }

  @override
  Future<void> deleteCompanyProfileImage() async {
    await ApiServices().delete(ApisUrls.deleteCompanyProfileImage);
  }

  @override
  Future<void> addCompanyPhoto(AddCompanyPhotoParameters parameters) async {
    await ApiServices().post(ApisUrls.addCompanyPhoto, data: await parameters.toJson());
  }

  @override
  Future<void> deleteCompanyPhoto(DeleteCompanyPhotoParameters parameters) async {
    await ApiServices().delete(ApisUrls.deleteCompanyPhoto(parameters.toQueryParameters()));
  }

  @override
  Future<void> updateClientProfile(UpdateClientProfileParameters parameters) async {
    await ApiServices()
        .put(ApisUrls.updateClientProfile, data: await parameters.toJson());
  }

  @override
  Future<void> deleteClientProfileImage() async {
    await ApiServices().delete(ApisUrls.deleteClientProfileImage);
  }
}
