import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawrni/features/auth/domain/parameters/change_password_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_client_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/does_company_email_exist_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/login_user_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_company_parameters.dart';
import 'package:dawrni/features/auth/domain/parameters/register_user_parameters.dart';
import 'package:dawrni/features/profile/data/model/company_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import 'auth_data_source.dart';

class AuthRemoteDataSourceImp extends AuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore store;

  AuthRemoteDataSourceImp({required this.auth, required this.store});

  @override
  Future<void> loginUser(LoginUserParameters parameters) async {
    await auth.signInWithEmailAndPassword(
        email: parameters.email, password: parameters.password);
  }

  @override
  Future<void> registerUser(RegisterUserParameters parameters) async {
    await auth
        .createUserWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    )
        .then((value) async {
      _createClientProfile(name: parameters.name, email: parameters.email);
      User? user = auth.currentUser!;

      await user.sendEmailVerification();
    });
  }

  @override
  Future<void> registerCompany(RegisterCompanyParameters parameters) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    )
        .then((value) async {
      _createCompanyProfile(
        name: parameters.name,
        email: parameters.email,
        license: parameters.license,
        category: parameters.category,
      );
      User? user = FirebaseAuth.instance.currentUser!;

      await user.sendEmailVerification();
    });
  }

  @override
  Future<UserModel> changePassword(ChangePasswordParameters parameters) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<bool> doesClientEmailExist(
      DoesClientEmailExistParameters email) async {
    final QuerySnapshot querySnapshot = await store
        .collection('users')
        .doc('clientsUid')
        .collection('clients')
        .where('email', isEqualTo: email.email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<bool> doesCompanyEmailExist(
      DoesCompanyEmailExistParameters email) async {
    final QuerySnapshot querySnapshot = await store
        .collection('users')
        .doc('companysUid')
        .collection('companys')
        .where('email', isEqualTo: email.email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> _createClientProfile(
      {required String name, required String email}) async {
    String userId = auth.currentUser!.uid;
    await store
        .collection('users')
        .doc('clientsUid')
        .collection('clients')
        .doc(userId)
        .set({
      'name': name,
      'email': email,
      'phone': '',
      'image': 'https://cdn-icons-png.flaticon.com/512/3001/3001764.png',
    });
  }

  Future<void> _createCompanyProfile({
    required String name,
    required String email,
    required String license,
    required String category,
  }) async {
    String userId = auth.currentUser!.uid;

    CompanyModel companyModel = CompanyModel(
        name: name,
        phone: '',
        email: email,
        image: 'https://cdn-icons-png.flaticon.com/512/2399/2399925.png',
        description: '',
        images: [],
        workingDays: [],
        workingHours: [],
        rating: 0,
        address: '',
        latlong: [],
        license: license,
        category: category,
        from: '00:00',
        to: '00:00');
    await store
        .collection('users')
        .doc('companysUid')
        .collection('companys')
        .doc(userId)
        .set(companyModel.toMap());
  }
}
