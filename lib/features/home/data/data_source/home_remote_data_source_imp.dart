import 'package:dawrni/core/constants/apis_urls.dart';
import 'package:dawrni/core/constants/app_constants.dart';
import 'package:dawrni/core/services/api_services.dart';
import 'package:dawrni/core/utils/app_response.dart';
import 'package:dawrni/features/home/data/data_source/home_data_source.dart';
import 'package:dawrni/features/home/data/models/companies_model.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';

class HomeRemoteDataSourceImp extends HomeDataSource {
  @override
  Future<CompaniesModel> getCompanies(GetCompaniesParameters parameters) async {
    // AppResponse response = await ApiServices()
    //     .get(ApisUrls.getCompanies, data: parameters.toJson());
    // return CompaniesModel.fromJson(response.data);
    await Future.delayed(const Duration(seconds: 2));
    return CompaniesModel(
      companies: [CompanyModel(id: 1, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 1, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
        CompanyModel(id: 2, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 2, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
        CompanyModel(id: 3, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 3, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
        CompanyModel(id: 4, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 4, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
        CompanyModel(id: 5, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 5, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),]
    );
  }
}
