import 'package:dartz/dartz.dart';
import 'package:dawrni/features/home/data/data_source/home_data_source.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/domain/parameters/get_companies_parameters.dart';
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
}
