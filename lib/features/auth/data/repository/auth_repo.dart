import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dawrni/features/profile/client/data/model/company_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  Future<Either<String, String>> registerClient(
      String name, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        _createClientProfile(name, email);
      });
      return right('Success Create Account');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return left('The account already exists for that email.');
      } else {
        return left(e.message.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> loginUser(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right('Successfully Login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else {
        return left(e.message.toString());
      }
    } catch (error) {
      return left(error.toString());
    }
  }

  Future _createClientProfile(String name, String email) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc('clientsUid')
        .collection('clients')
        .doc(userId)
        .set({
      'name': name,
      'email': email,
      'phone': '00000',
      'image': 'https://cdn-icons-png.flaticon.com/512/3001/3001764.png',
    });
  }

  /////company register
  Future<Either<String, String>> registerCompany({
    required String name,
    required String email,
    required String password,
    required String category,
    required String license,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        _createCompanyProfile(
          name: name,
          email: email,
          license: license,
          category: category,
        );
      });
      return right('Success Create Account');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return left('The account already exists for that email.');
      } else {
        return left(e.message.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future _createCompanyProfile({
    required String name,
    required String email,
    required String license,
    required String category,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    CompanyModel companyModel = CompanyModel(
        name: name,
        phone: '0000',
        email: email,
        image: 'https://cdn-icons-png.flaticon.com/512/2399/2399925.png',
        description: ' ',
        images: [],
        workingDays: [],
        workingHours: [],
        rating: 0);
    FirebaseFirestore.instance
        .collection('users')
        .doc('companysUid')
        .collection('companys')
        .doc(userId)
        .set(companyModel.toMap());
  }
}
