import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_company_details_parameters.dart';


abstract class HomeRepository {
  Future<Either<Failure, CompaniesEntity>> getCompanies(GetCompaniesParameters parameters);
  Future<Either<Failure, CompanyEntity>> getCompanyDetails(GetCompanyDetailsParameters parameters);
}
