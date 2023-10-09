import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/snack_bar_widget.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:dawrni/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/show_awesomeDialog.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.email,
                size: 100.0,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Verify your email address',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              const SizedBox(height: 20.0),
              const Text(
                  'A verification link has been sent to your email address. Please check your inbox and click on the link to verify your email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, color: AppColors.white)),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.currentUser?.reload();
                  bool? result =
                      FirebaseAuth.instance.currentUser?.emailVerified;
                  FirebaseAuth.instance.currentUser?.reload();
                  if (result == true) {
                    context.go(MainRoute.name);
                  } else {
                    showSnackBarWidget(
                        context: context,
                        message: 'Email Not Verify',
                        requestStates: RequestStates.error);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                child: const Text('Check Verification Email'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  showSnackBarWidget(
                      context: context,
                      message: 'Verification email resent.',
                      requestStates: RequestStates.success);
                },
                child: const Text('Resend Verification Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
