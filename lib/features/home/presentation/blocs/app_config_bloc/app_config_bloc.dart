import 'dart:async';
import 'package:dawrni/core/enums/app_languages.dart';
import 'package:dawrni/core/translations/app_local.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_config_state.dart';
part 'app_config_event.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {

  AppConfigBloc()
      : super(AppConfigState(language: AppLocale().currentLanguage())) {
    on<ChangeLanguageEvent>(_setLanguage);
  }

  FutureOr<void> _setLanguage(ChangeLanguageEvent event, emit) async {
    await AppLocale().setLocale(event.language);
    emit(AppConfigState(language: AppLocale().currentLanguage()));
  }
}
