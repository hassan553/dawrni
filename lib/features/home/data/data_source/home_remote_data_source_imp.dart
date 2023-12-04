import 'package:dawrni/core/constants/apis_urls.dart';
import 'package:dawrni/core/services/api_services.dart';
import 'package:dawrni/core/utils/app_response.dart';
import 'package:dawrni/features/home/data/data_source/home_data_source.dart';
import 'package:dawrni/features/home/data/models/companies_model.dart';
import 'package:dawrni/features/home/domain/parameters/add_to_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/book_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/delete_from_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_company_details_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_favorites_parameters.dart';

class HomeRemoteDataSourceImp extends HomeDataSource {
  @override
  Future<CompaniesModel> getCompanies(GetCompaniesParameters parameters) async {
    AppResponse response = await ApiServices()
        .get(ApisUrls.getCompanies(parameters.toQueryParameters()));
    return CompaniesModel.fromJson(response.data);
    // await Future.delayed(const Duration(seconds: 2));
    // return CompaniesModel(
    //   companies: [CompanyModel(id: 1, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 1, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //     CompanyModel(id: 2, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 2, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //     CompanyModel(id: 3, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 3, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //     CompanyModel(id: 4, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 4, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //     CompanyModel(id: 5, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 5, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),]
    // );
  }

  @override
  Future<CompanyModel> getCompanyDetails(GetCompanyDetailsParameters parameters) async {
    await Future.delayed(const Duration(seconds: 2));
    return CompanyModel(id: 2, about: '', address: '', categoryId: 2, isCertified: true, name: 'Al Husein repairing', user: "1");
    AppResponse response = await ApiServices()
        .get(ApisUrls.getCompanyDetails(parameters.id));
    return CompanyModel.fromJson(response.data);
  }

  @override
  Future<void> bookAppointment(BookParameters parameters) async {
    await ApiServices().post(ApisUrls.bookAppointment(parameters.toQueryParameters()), data: parameters.toJson());
  }

  @override
  Future<CompaniesModel> getFavorites(GetFavoritesParameters parameters) async {
    AppResponse response = await ApiServices()
        .get(ApisUrls.getFavorites(parameters.toQueryParameters()), data: parameters.toJson());
    return CompaniesModel.fromJson(response.data);
    // await Future.delayed(const Duration(seconds: 2));
    // return CompaniesModel(
    //     companies: [CompanyModel(id: 1, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 1, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //       CompanyModel(id: 2, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 2, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //       CompanyModel(id: 3, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 3, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //       CompanyModel(id: 4, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 4, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),
    //       CompanyModel(id: 5, aboutAr: '', aboutEn: '', addressAr: '', addressEn: '', category: Category(id: 5, name: 'ad'), isCertified: true, nameAr: 'Al Husein repairing', nameEn: 'Al Husein repairing', user: 1),]
    // );
  }

  @override
  Future<void> addToFavorites(AddToFavoritesParameters parameters) async {
    await ApiServices().post(ApisUrls.addToFavorites(parameters.toQueryParameters()));
  }

  @override
  Future<void> deleteFromFavorites(DeleteFromFavoritesParameters parameters) async {
    await ApiServices().delete(ApisUrls.deleteFromFavorites(parameters.toQueryParameters()));
  }
}
