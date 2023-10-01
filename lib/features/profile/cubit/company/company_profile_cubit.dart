import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../../core/contants/upload_image.dart';
import '../../data/model/company_model.dart';
import '../../data/repository/company_profile_repo.dart';
part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileRepo repo;
  CompanyProfileCubit(this.repo) : super(CompanyProfileInitial());
  static CompanyProfileCubit get(context) => BlocProvider.of(context);

//////////////get Company data ///////////
  CompanyModel? companyModel;
  void fetchCompanyProfile() async {
    emit(GetCompanyProfileLoadingState());
    print('i in the function');
    final result = await repo.getCompanyProfile();
    result.fold((l) {
      print('wrrrorr $l');
      emit(GetCompanyProfileErrorState(l));
    }, (r) {
      companyModel = r;
      print('ddddddddd ${r.images}');
      emit(GetCompanyProfileSuccessState());
    });
  }

  Future changeCompanyImageProfile() async {
    // print(companyModel!.image);

    // repo.updateCompanyProfileImage().then((value) {
    //   repo.getCompanyProfile();
    //   print('done upload ....');
    //   emit(ChangeCompanyProfileImageSuccessState());
    // });
  }

  File? imageProfile;
  final String _userUid = FirebaseAuth.instance.currentUser!.uid;
  void updateUserImage() async {
    try {
      imageProfile = await PickImageAndUpload().getImage();
      String? image = await PickImageAndUpload().uploadImage(imageProfile);
      FirebaseFirestore.instance
          .collection('users')
          .doc('companysUid')
          .collection('companys')
          .doc(_userUid)
          .update({'image': image}).then((value) {
        fetchCompanyProfile();
      });

      emit(UpdateCompanyProfileImageSuccessState());
    } catch (error) {
      emit(UpdateCompanyProfileImageErrorState());
    }
  }

  String? name;
  updateName(String name) async {
    if (name.isNotEmpty) {
      repo.updateProfileName(name).then((value) {
        fetchCompanyProfile();
      });
      emit(UpdateCompanyProfileNameSuccessState());
    } else {
      emit(NotValidEmptyValueState());
    }
  }

  String? description;
  updateDescription(String description) async {
    if (description.isNotEmpty) {
      repo.updateProfileDescription(description).then((value) {
        fetchCompanyProfile();
      });
      emit(UpdateCompanyProfileDescriptionSuccessState());
    } else {
      emit(NotValidEmptyValueState());
    }
  }

  var images = [];
  void seletImages() async {
    emit(SelectImagesLoadingState());
    final result = await repo.uploadImages();
    result.fold((l) {
      emit(SelectImagesErrorState());
    }, (r) {
      images = r;
      print(images);
      emit(SelectImagesSuccessState(images));
    });
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

  updateProfile({
    required String name,
    required String description,
    required String address,
    required List latlong,
    required String from,
    required String to,
    required List workingDays,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      emit(UpdateDataLoadingState());
      final result = await repo.updateProfileData(
        name: name,
        description: description,
        address: address,
        latlong: latlong,
        from: from,
        to: to,
        workingDays: workingDays,
        images: images,
      );
      result.fold((l) => emit(UpdateDataErrorState()), (r) {
        fetchCompanyProfile();
        emit(UpdateDataSuccessState());
      });
    } else {
      emit(NotValidEmptyValueState());
    }
  }

  Future selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      String timeAsString =
          '${picked.hour}:${picked.minute.toString().padLeft(2, '0')}';
      return timeAsString;
    }

    emit(SelectTimeState());
  }
}
