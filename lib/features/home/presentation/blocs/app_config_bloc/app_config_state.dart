part of 'app_config_bloc.dart';

class AppConfigState extends Equatable {
  final AppLanguages language;
  final AppState appState;
  final bool loading;

  const AppConfigState({required this.language, required this.appState, required this.loading});

  AppConfigState copyWith({
    AppLanguages? language,
    AppState? appState,
    bool? loading
  }) =>
      AppConfigState(
          language: language ?? this.language,
          appState: appState ?? this.appState,
          loading: loading ?? this.loading
      );

  @override
  List<Object> get props => [language, appState, loading];
}
