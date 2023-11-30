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

class LogOutEvent extends AppConfigEvent {
  const LogOutEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AppConfigEvent {
  final UserEntity user;
  const LogInEvent({required this.user});

  @override
  List<Object> get props => [user];
}
