import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/add_to_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/book_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/delete_from_favorites_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_company_details_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_favorites_parameters.dart';


abstract class HomeRepository {
  Future<Either<Failure, CompaniesEntity>> getCompanies(GetCompaniesParameters parameters);
  Future<Either<Failure, CompanyEntity>> getCompanyDetails(GetCompanyDetailsParameters parameters);
  Future<Either<Failure, void>> bookAppointment(BookParameters parameters);
  Future<Either<Failure, CompaniesEntity>> getFavorites(GetFavoritesParameters parameters);
  Future<Either<Failure, void>> addToFavorites(AddToFavoritesParameters parameters);
  Future<Either<Failure, void>> deleteFromFavorites(DeleteFromFavoritesParameters parameters);
}
