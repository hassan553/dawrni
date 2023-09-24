part of 'client_profile_cubit.dart';

sealed class ClientProfileState extends Equatable {
  const ClientProfileState();

  @override
  List<Object> get props => [];
}

final class ClientProfileInitial extends ClientProfileState {}

class GetClientProfileLoadingState extends ClientProfileState {}

class GetClientProfileSuccessState extends ClientProfileState {}

class GetClientProfileErrorState extends ClientProfileState {
  final String error;
  const GetClientProfileErrorState(this.error);
}
