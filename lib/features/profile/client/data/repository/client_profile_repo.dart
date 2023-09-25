import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dawrni/features/profile/client/data/model/client_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClientProfileRepo {
  final String _userUid = FirebaseAuth.instance.currentUser!.uid;

  Future<Either<String, ClientModel>> getClientProfile() async {
    ClientModel? user;
    print('uid $_userUid');
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('clientsUid')
          .collection('clients')
          .doc(_userUid)
          .get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      print('dddddasa $data');
      user = ClientModel.fromJson(data);
      print('user $user');
      return right(user);
    } catch (error) {
      print(error.toString());
      return left(error.toString());
    }
  }

  Future updateProfileName(String name) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc('clientsUid')
          .collection('clients')
          .doc(_userUid)
          .update({'name': name});
    } catch (error) {
      return error.toString();
    }
  }
}
