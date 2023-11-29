import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawrni/features/appointments/data/data_source/appointments_data_source.dart';
import 'package:dawrni/features/appointments/data/data_source/appointments_remote_data_source_imp.dart';
import 'package:dawrni/features/appointments/data/repository/appointments_repository_imp.dart';
import 'package:dawrni/features/appointments/domain/repository/appointments_repository.dart';
import 'package:dawrni/features/appointments/presentation/blocs/client_appointments_bloc/client_appointments_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/delete_client_appointment_bloc/delete_client_appointment_bloc.dart';
import 'package:dawrni/features/auth/data/data_source/auth_data_source.dart';
import 'package:dawrni/features/auth/data/data_source/auth_remote_data_source_imp.dart';
import 'package:dawrni/features/auth/data/repository/auth_repository_imp.dart';
import 'package:dawrni/features/auth/domain/repository/auth_repository.dart';
import 'package:dawrni/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:dawrni/features/auth/presentation/blocs/verify_email/verify_email_bloc.dart';
import 'package:dawrni/features/home/data/data_source/home_data_source.dart';
import 'package:dawrni/features/home/data/data_source/home_remote_data_source_imp.dart';
import 'package:dawrni/features/home/data/repository/home_repository_imp.dart';
import 'package:dawrni/features/home/domain/repository/home_repository.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/book_bloc/book_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/companies_bloc/companies_bloc.dart';
import 'package:dawrni/features/home/presentation/blocs/company_details_bloc/company_details_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/blocs/login/login_bloc.dart';

final sl = GetIt.instance;

/// This class [ServicesLocator] is define to inject values and variables (Objects) into memory when the application is opened,
/// those values will remain stored and preserved for direct access in randomaccess memory according to the specified conditions
/// and situations.
///
/// The concept of injection depends on dependency injection, using the get_it library to provide this type of service,
///
/// it is necessary You have to call [ServicesLocator.init] in main.dart, main finction, before [runApp]
///
/// 1- to inject Your Bloc object use [registerFactory] function
///    Ex:   sl.registerFactory(() => YourBloc(sl()));
/// 2- to inject Your Repository, Data Source object use [registerLazySingleton] function
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///
/// you can get any Object you inject by call [sl]
///    Ex: sl<YourBloc>();

// TODO: add (BLOCs , REPOSITORIES , DATA SOURCES)
class ServicesLocator {
  static ServicesLocator? _instance;
  ServicesLocator._();
  factory ServicesLocator() => _instance ??= ServicesLocator._();

  void init() {
    //// BLOCS
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => VerifyEmailBloc(sl()));
    sl.registerFactory(() => CompaniesBloc(sl()));
    sl.registerFactory(() => CompanyDetailsBloc(sl()));
    sl.registerFactory(() => BookBloc(sl()));
    sl.registerFactory(() => ClientAppointmentsBloc(sl()));
    sl.registerFactory(() => DeleteClientAppointmentBloc(sl()));

    sl.registerLazySingleton(() => AppConfigBloc());

    //// REPOSITORIES
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(sl()));
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(sl()));
    sl.registerLazySingleton<AppointmentsRepository>(() => AppointmentsRepositoryImp(sl()));

    //// DATA SOURCES
    sl.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSourceImp(auth: sl(), store: sl()));
    sl.registerLazySingleton<HomeDataSource>(() => HomeRemoteDataSourceImp());
    sl.registerLazySingleton<AppointmentsDataSource>(() => AppointmentsRemoteDataSourceImp());

    final auth = FirebaseAuth.instance;

    sl.registerLazySingleton(() => auth);

    final FirebaseFirestore store = FirebaseFirestore.instance;
    sl.registerLazySingleton(() => store);
  }
}
