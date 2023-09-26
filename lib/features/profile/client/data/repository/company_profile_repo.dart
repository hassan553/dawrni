import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dawrni/features/profile/client/data/model/company_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CompanyProfileRepo {
  final String _userUid = FirebaseAuth.instance.currentUser!.uid;
  CompanyModel company = CompanyModel(
      name: '',
      phone: '',
      email: '',
      image: '',
      description: '',
      images: [],
      workingDays: [],
      workingHours: [],
      rating: 0);
  Future<Either<String, CompanyModel>> getCompanyProfile() async {
    print('uid $_userUid');
    try {
      print('ereeeeeee');
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

  Future updateProfileDescription(String description) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('companysUid')
          .collection('companys')
          .doc(_userUid)
          .update({'description': description});
    } catch (error) {
      return error.toString();
    }
  }

  Future<Either<String, List<String>>> uploadImages() async {
    try {
      List<String> images = [];
      List<XFile> selectedImages = await ImagePicker().pickMultiImage();
      if (selectedImages.isNotEmpty) {
        for (var image in selectedImages) {
          File file = File(image.path);
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          Reference storageReference =
              FirebaseStorage.instance.ref().child('images/$fileName');
          UploadTask uploadTask = storageReference.putFile(file);
          await uploadTask.whenComplete(() async {
            images.add(await storageReference.getDownloadURL());
          });
        }
      }
      company.images.forEach((element) {
        images.add(element);
      });

      await _updateCompanyImages(images);
      return right(images);
    } catch (error) {
      return left('faild to upload images');
    }
  }

  _updateCompanyImages(List<String> images) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('companysUid')
          .collection('companys')
          .doc(_userUid)
          .update({'images': images});
    } catch (error) {
      return error.toString();
    }
  }

  Future<Either<String, String>> changePassword(String email) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right('Send Password Email Change');
    } on FirebaseAuthException catch (error) {
      return left(error.message.toString());
    }
  }
}

