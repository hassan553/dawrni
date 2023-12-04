import 'package:dawrni/core/constants/apis_urls.dart';
import 'package:dawrni/core/services/api_services.dart';
import 'package:dawrni/core/utils/app_response.dart';
import 'package:dawrni/features/profile/data/data_source/profile_data_source.dart';
import 'package:dawrni/features/profile/data/models/client_profile_model.dart';
import 'package:dawrni/features/profile/data/models/company_profile_model.dart';
import 'package:dawrni/features/profile/domain/parameters/profile_parameter.dart';

// TODO: add urls and implemente post and get methods
class ProfileRemoteDataSourceImp extends ProfileDataSource {
  @override
  Future<ClientProfileModel> getClientProfile() async {
    // AppResponse appResponse = await ApiServices().get(ApisUrls.getProfile);
    // return ClientProfileModel.fromJson(appResponse.data);
    await Future.delayed(const Duration(seconds: 2));
    return ClientProfileModel(
        nameEn: 'Abdullah Otaibi',
        nameAr: 'عبدالله العتيبي',
        imageUrl: "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    );
  }

  @override
  Future<ClientProfileModel> postUserInfo(
      UserProfileParameters clientProfileParameters) async {
    AppResponse appResponse = await ApiServices().post(
        'ApisUrls.postUserProfielInfo',
        data: clientProfileParameters.toJson());
    return ClientProfileModel.fromJson(appResponse.data);
  }

  @override
  Future<CompanyProfileModel> getCompanyProfile() async {
    // AppResponse appResponse = await ApiServices().get(ApisUrls.getProfile);
    // return CompanyProfileModel.fromJson(appResponse.data);
    await Future.delayed(const Duration(seconds: 2));
    return CompanyProfileModel(
      nameEn: 'Abdullah Otaibi',
      nameAr: 'عبدالله العتيبي',
      aboutEn: "about En " * 10,
      aboutAr: "حول التطبيق" * 10,
      addressEn: "This is address",
      addressAr: "هذا هو العنوان",
      imageUrl: "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      photos: [
        "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
        "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
        "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
        "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
        "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
      ],
      lat: 33,
      lng: 30,
      categoryId: 1
    );
  }

}
