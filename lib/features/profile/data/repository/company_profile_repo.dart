import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dawrni/features/profile/data/models/company_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CompanyProfileRepo {
  final String _userUid = FirebaseAuth.instance.currentUser!.uid;
  CompanyModel _company = const CompanyModel(
    name: '',
    phone: '',
    email: '',
    image: '',
    description: '',
    images: [],
    workingDays: [],
    workingHours: [],
    rating: 0,
    address: '',
    category: '',
    latlong: [],
    license: '',
    from: '00:00',
    to: '00:00',
  );
  Future<Either<String, CompanyModel>> getCompanyProfile() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('companysUid')
          .collection('companys')
          .doc(_userUid)
          .get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      _company = CompanyModel.fromJson(data);

      return right(_company);
    } catch (error) {
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
      _company.images.forEach((element) {
        images.add(element);
      });

      return right(images);
    } catch (error) {
      return left('faild to upload images');
    }
  }

  // _updateCompanyImages(List<String> images) async {
  //   try {
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc('companysUid')
  //         .collection('companys')
  //         .doc(_userUid)
  //         .update({'images': images});
  //   } catch (error) {
  //     return error.toString();
  //   }
  //}

  Future<Either<String, String>> changePassword(String email) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right('Send Password Email Change');
    } on FirebaseAuthException catch (error) {
      return left(error.message.toString());
    }
  }

  Future<Either<String, String>> updateProfileData({
    required String name,
    required String description,
    required String address,
    required List latlong,
    required List workingDays,
    required String from,
    required String to,
    List images = const [],
  }) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('companysUid')
          .collection('companys')
          .doc(_userUid)
          .update({
        'name': name,
        'description': description,
        'latlong': latlong,
        'address': address,
        'from': from,
        'to': to,
        'workingDays': workingDays,
        'images': images,
      });
      return right('Success Update Data');
    } catch (error) {
      return left(error.toString());
    }
  }
}
