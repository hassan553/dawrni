part of 'app_config_bloc.dart';

class AppConfigState extends Equatable {
  final AppLanguages language;

  const AppConfigState({required this.language});

  @override
  List<Object> get props => [language];
}
