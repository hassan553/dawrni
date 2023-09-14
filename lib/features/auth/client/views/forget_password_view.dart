import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_filed.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isEmpty = true;
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSizedBox(value: .04),
              topImage(context),
              const CustomSizedBox(value: .1),
              const ResponsiveText(
                text: 'Password Confirmation',
                scaleFactor: .06,
                fontWeight: FontWeight.bold,
              ),
              const CustomSizedBox(value: .02),
              ResponsiveText(
                text:
                    'Your password will be your key to secure access in the future',
                scaleFactor: .04,
                color: AppColors.offWhite,
              ),
              const CustomSizedBox(value: .07),
              enterIinfo(),
              const CustomSizedBox(value: .02),
              forgetPasswordButton(),
              const CustomSizedBox(value: .03),
              signUpButton()
            ],
          ),
        ),
      )),
    );
  }

  Form enterIinfo() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFieldWidget(
              icon: Icon(
                Icons.lock_outline,
                color: AppColors.offWhite,
              ),
              controller: password,
              valid: (String? value) {
                if (value == null) {
                  return 'Not Valid empty value';
                } else if (value.length < 8) {
                  return 'short password';
                }
              },
              obscure: true,
              hintText: 'Password'),
          const CustomSizedBox(value: .02),
          CustomTextFieldWidget(
              icon: Icon(
                Icons.lock_outline,
                color: AppColors.offWhite,
              ),
              controller: confirmPassword,
              onChange: (value) {
                if (password.text.isEmpty || confirmPassword.text.isEmpty) {
                  setState(() {
                    isEmpty = true;
                  });
                } else {
                  setState(() {
                    isEmpty = false;
                  });
                }
              },
              valid: (String? value) {
                if (value == null) {
                  return 'Not Valid empty value';
                } else if (value != password.text) {
                  return 'write valid password';
                }
              },
              obscure: true,
              hintText: 'Confirm Password'),
        ],
      ),
    );
  }

  Row signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'If you have an account? ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.20,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign In here',
            style: TextStyle(
              color: Color(0xFFFF8700),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              height: 1.43,
              letterSpacing: 0.20,
            ),
          ),
        ),
      ],
    );
  }

  Widget forgetPasswordButton() {
    return isEmpty == true
        ? ColorFiltered(
            colorFilter:
                ColorFilter.mode(AppColors.offWhite, BlendMode.modulate),
            child: CustomButton(
              function: () {},
              color: AppColors.primaryColor,
              textColor: AppColors.white,
              fontSize: .04,
              title: ' Confirm',
            ),
          )
        : CustomButton(
            function: () {},
            color: AppColors.primaryColor,
            textColor: AppColors.white,
            fontSize: .04,
            title: ' Confirm',
          );
  }

  Image topImage(BuildContext context) {
    return Image.asset(
      'assets/Asset 12 1.png',
      width: screenSize(context).width * .3,
      fit: BoxFit.fill,
    );
  }
}
