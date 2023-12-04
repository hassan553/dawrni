part of 'client_profile_bloc.dart';

sealed class ClientProfileEvent extends Equatable {
  const ClientProfileEvent();
  @override
  List<Object> get props => [];
}

class FetchClientProfileEvent extends ClientProfileEvent {
  const FetchClientProfileEvent();
}
