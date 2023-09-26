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
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'client_profile_state.dart';

class ClientProfileCubit extends Cubit<ClientProfileState> {
  ClientProfileRepo repo;
  ClientProfileCubit(this.repo) : super(ClientProfileInitial());
  static ClientProfileCubit get(context) => BlocProvider.of(context);
//////////////get client data ///////////

  ClientModel? clientModel;
  void fetchClientProfile() async {
    emit(GetClientProfileLoadingState());
    final result = await repo.getClientProfile();
    result.fold((l) => emit(GetClientProfileErrorState(l)), (r) {
      clientModel = r;
      emit(GetClientProfileSuccessState());
    });
  }

  File? imageProfile;
  final String _userUid = FirebaseAuth.instance.currentUser!.uid;
  void updateUserImage() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
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
        emit(UpdateClientProfileImageErrorState(error.toString()));
      }
    } else {
      emit(NoInternetState());
    }
  }

  updateName(String name) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      repo.updateProfileName(name).then((value) {
        fetchClientProfile();
      });
      emit(UpdateClientProfileNameSuccessState());
    } else {
      emit(NoInternetState());
    }
  }

  bool isTab = false;
  void changeIsTab() {
    isTab = !isTab;
    print(isTab);
    emit(PhoneIsTabState());
  }

  void changePassword(String email) async {
    bool _result = await InternetConnectionChecker().hasConnection;

    if (_result == true) {
      emit(ChangePasswordLoadingState());
      final result = await repo.changePassword(email);
      result.fold((l) {
        emit(ChangePasswordErrorState());
      }, (r) {
        emit(ChangePasswordSuccessState());
      });
    } else {
      emit(NoInternetState());
    }
  }
}
