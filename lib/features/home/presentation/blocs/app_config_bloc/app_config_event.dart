part of 'app_config_bloc.dart';

sealed class AppConfigEvent extends Equatable {
  const AppConfigEvent();
  @override
  List<Object> get props => [];
}

class ChangeLanguageEvent extends AppConfigEvent {
  final AppLanguages language;
  const ChangeLanguageEvent({required this.language});

  @override
  List<Object> get props => [language];
}
