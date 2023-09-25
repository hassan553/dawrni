import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dawrni/features/profile/client/data/model/company_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompanyProfileRepo {
  final String _userUid = FirebaseAuth.instance.currentUser!.uid;

  Future<Either<String, CompanyModel>> getCompanyProfile() async {
    CompanyModel? company;
    print('uid $_userUid');
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('companysUid')
          .collection('companys')
          .doc(_userUid)
          .get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      print('dddddasa $data');
      company = CompanyModel.fromJson(data);
      print('user $company');
      return right(company);
    } catch (error) {
      print('erro in repo${error.toString()}');
      return left(error.toString());
    }
  }

  Future updateCompanyProfileImage() async {
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(
        'https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg');
  }
   Future updateProfileName(String name) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('companysUid')
          .collection('companys')
          .doc(_userUid)
          .update({'name': name});
    } catch (error) {
      return error.toString();
    }
  }
}
