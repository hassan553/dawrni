import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String _verificationId;
  String selectedValue = 'Option 1';
  List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];
  PhoneAuthCubit() : super(PhoneAuthInitial());
  static PhoneAuthCubit get(context) => BlocProvider.of(context);
  Future<void> submitPhoneNumber(String phoneNumber) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      emit(Loading());
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2$phoneNumber',
        timeout: const Duration(seconds: 14),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } else {
      emit(NoInternetConnections());
    }
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErrorOccurred(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    _verificationId = verificationId;
    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTPForLogin(String otpCode) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otpCode);

      await signIn(credential);
    } else {
      emit(NoInternetConnections());
    }
  }

  Future<void> submitClientOTP(
      String otpCode, String name, String phone) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otpCode);

      await signIn(credential).then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc('clientsUid')
            .collection('clients')
            .add({
          'name': name,
          'phone': phone,
          'image': 'https://cdn-icons-png.flaticon.com/512/3001/3001764.png',
        });
      });
    } else {
      emit(NoInternetConnections());
    }
  }

  Future<void> submitCompanyOTP(String otpCode, String name, String phone,
      String category, String license) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otpCode);

      await signIn(credential).then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc('companysUid')
            .collection('companys')
            .add({
          'name': name,
          'phone': phone,
          'license': license,
          'image': 'https://cdn-icons-png.flaticon.com/512/2399/2399925.png',
        });
      });
    } else {
      emit(NoInternetConnections());
    }
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(PhoneOTPVerified());
    } catch (error) {
      emit(ErrorOccurred(errorMsg: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
