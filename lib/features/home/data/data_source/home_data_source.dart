import 'package:dawrni/features/home/data/models/companies_model.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';

abstract class HomeDataSource {
  Future<CompaniesModel> getCompanies(GetCompaniesParameters parameters);
}