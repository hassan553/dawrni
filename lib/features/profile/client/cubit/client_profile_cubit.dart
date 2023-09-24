import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dawrni/features/profile/client/data/model/client_model.dart';
import 'package:dawrni/features/profile/client/data/repository/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_profile_state.dart';

class ClientProfileCubit extends Cubit<ClientProfileState> {
  ClientProfileRepo repo;
  ClientProfileCubit(this.repo) : super(ClientProfileInitial());
  static ClientProfileCubit get(context) => BlocProvider.of(context);
//////////////get client data ///////////
  final StreamController<ClientModel> _controller =
      StreamController<ClientModel>();
  ClientModel? clientModel;
  void fetchClientProfile() async {
    emit(GetClientProfileLoadingState());
    final result = await repo.getClientProfile();
    result.fold((l) => emit(GetClientProfileErrorState(l)), (r) {
      clientModel = r;
      print('ddddddddd $r');
      emit(GetClientProfileSuccessState());
    });
  }
}
