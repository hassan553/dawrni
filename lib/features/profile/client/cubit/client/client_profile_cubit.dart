import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawrni/core/contants/upload_image.dart';
import 'package:dawrni/features/profile/client/data/model/client_model.dart';
import 'package:dawrni/features/profile/client/data/repository/client_profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  File? imageProfile;
  final String _userUid = FirebaseAuth.instance.currentUser!.uid;
  void updateUserImage() async {
    try {
      imageProfile = await PickImageAndUpload().getImage();
      String? image = await PickImageAndUpload().uploadImage(imageProfile);
      FirebaseFirestore.instance
          .collection('users')
          .doc('clientsUid')
          .collection('clients')
          .doc(_userUid)
          .update({'image': image}).then((value) {
        fetchClientProfile();
      });

      emit(UpdateClientProfileImageSuccessState());
    } catch (error) {
      emit(UpdateClientProfileImageErrorState());
    }
  }

  updateName(String name) async {
    repo.updateProfileName(name).then((value) {
      fetchClientProfile();
    });
    emit(UpdateClientProfileNameSuccessState());
  }
}
