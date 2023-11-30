import 'package:dawrni/features/home/data/models/companies_model.dart';
import 'package:dawrni/features/home/domain/parameters/add_to_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/book_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/delete_from_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_company_details_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_favorites_parameters.dart';

abstract class HomeDataSource {
  Future<CompaniesModel> getCompanies(GetCompaniesParameters parameters);
  Future<CompanyModel> getCompanyDetails(GetCompanyDetailsParameters parameters);
  Future<void> bookAppointment(BookParameters parameters);
  Future<CompaniesModel> getFavorites(GetFavoritesParameters parameters);
  Future<void> addToFavorites(AddToFavoritesParameters parameters);
  Future<void> deleteFromFavorites(DeleteFromFavoritesParameters parameters);
}