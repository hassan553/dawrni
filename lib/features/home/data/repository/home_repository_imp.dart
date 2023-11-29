import 'package:dartz/dartz.dart';
import 'package:dawrni/features/home/data/data_source/home_data_source.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/book_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
import 'package:dawrni/features/home/domain/parameters/get_company_details_parameters.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';

import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImp(this.homeDataSource);

  @override
  Future<Either<Failure, CompaniesEntity>> getCompanies(
      GetCompaniesParameters parameters) {
    return ErrorsHandler.handleEither(
        () => homeDataSource.getCompanies(parameters));
  }

  @override
  Future<Either<Failure, CompanyEntity>> getCompanyDetails(
      GetCompanyDetailsParameters parameters) {
    return ErrorsHandler.handleEither(
        () => homeDataSource.getCompanyDetails(parameters));
  }

  @override
  Future<Either<Failure, void>> bookAppointment(BookParameters parameters) async {
    try {
      await homeDataSource.bookAppointment(parameters);
      return const Right(null);
    } catch (e) {
     return Left(ErrorsHandler.failureThrower(e));
    }
  }
}
