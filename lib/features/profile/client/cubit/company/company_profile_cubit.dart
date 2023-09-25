import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final result = await repo.getCompanyProfile();
    result.fold((l) {
      print('wrrrorr $l');
      emit(GetCompanyProfileErrorState(l));
    }, (r) {
      companyModel = r;
      print('ddddddddd $r');
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
}
