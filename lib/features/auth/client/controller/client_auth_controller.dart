import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientAuthController extends GetxController {
  String? _verificationId='';
  var loading = false.obs;
  var success = false.obs;
  Future<void> submitPhoneNumber(String phoneNumber) async {
    try {
      loading.value = true;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2$phoneNumber',
        timeout: const Duration(seconds: 14),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (error) {
      Get.dialog(
        AlertDialog(
          title: const Text('Dialog Title'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
      loading.value = false;
    }
  }

  void verificationCompleted(PhoneAuthCredential credential) async {}

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    Get.dialog(
      AlertDialog(
        title: Text('Dialog Title'),
        content: Text(error.toString()),
        actions: [
          TextButton(
            onPressed: () {
              // Close the dialog when the button is pressed.
              Get.back();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
    loading.value = false;
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    _verificationId = verificationId;
    success.value = true;
    loading.value = false;
  }

  void codeAutoRetrievalTimeout(String verificationId) {}
  var loadingOtp = false.obs;
  Future<void> submitOTP(String otpCode, String name, String phone) async {
    loadingOtp.value = true;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otpCode);

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
    loadingOtp.value = false;
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      Get.dialog(
        AlertDialog(
          title: Text('Dialog Title'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog when the button is pressed.
                Get.back();
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  String getLoggedInUser() {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    return firebaseUser;
  }
}
