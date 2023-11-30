import 'dart:async';
import 'package:dawrni/core/enums/app_languages.dart';
import 'package:dawrni/core/enums/app_state.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/translations/app_local.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_config_state.dart';
part 'app_config_event.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {

  AppConfigBloc()
      : super(AppConfigState(language: AppLocale().currentLanguage(),  appState: CacheStorageServices().hasToken ? AppState.loggedIn : AppState.loggedOut, loading: false)) {
    on<ChangeLanguageEvent>(_setLanguage);
    on<LogInEvent>(_logIn);
    on<LogOutEvent>(_logOut);
  }

  FutureOr<void> _setLanguage(ChangeLanguageEvent event, emit) async {
    emit(state.copyWith(loading: true));
    await AppLocale().setLocale(event.language);
    emit(state.copyWith(language: AppLocale().currentLanguage(), loading: false));
  }

  FutureOr<void> _logIn(LogInEvent event, emit) async {
    emit(state.copyWith(loading: true));
    await CacheStorageServices().setEmail(event.user.email);
    await CacheStorageServices().setToken(event.user.token);
    await CacheStorageServices().setUserType(event.user.type);
    emit(state.copyWith(appState: AppState.loggedIn, loading: false));
  }

  FutureOr<void> _logOut(LogOutEvent event, emit) async {
    emit(state.copyWith(loading: true));
    await CacheStorageServices().clearAll();
    emit(state.copyWith(appState: AppState.loggedOut, loading: false));
  }
}
