import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';

class RegisterClientView extends StatefulWidget {
  const RegisterClientView({super.key});

  @override
  State<RegisterClientView> createState() => _RegisterClientViewState();
}

class _RegisterClientViewState extends State<RegisterClientView> {
  bool isClient = false;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomSizedBox(value: .04),
            topImage(context),
            const CustomSizedBox(value: .1),
            companyOrClientButton(context),
            const CustomSizedBox(value: .02),
            enterIfonBody(),
            const CustomSizedBox(value: .03),
            registerButton(),
            const CustomSizedBox(value: .03),
            signUpButton()
          ],
        ),
      )),
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

  CustomButton registerButton() {
    return CustomButton(
      function: () {},
      color: AppColors.primaryColor,
      textColor: AppColors.white,
      fontSize: .04,
      title: ' Sign Up',
    );
  }

  Form enterIfonBody() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFieldWidget(
            icon: Image.asset('assets/Group.png'),
            controller: name,
            valid: (String? value) {
              if (value == null) {
                return 'Not Valid empty value';
              }
            },
            hintText: isClient == false ? 'Full name' : 'Company',
          ),
          const CustomSizedBox(value: .02),
          CustomTextFieldWidget(
              icon: Icon(
                Icons.lock_outline,
                color: AppColors.offWhite,
              ),
              controller: phoneNumber,
              valid: (String? value) {
                if (value == null) {
                  return 'Not Valid empty value';
                } else if (value.length < 8) {
                  return 'short password';
                }
              },
              hintText: 'Password'),
        ],
      ),
    );
  }

  Container companyOrClientButton(BuildContext context) {
    return Container(
      width: screenSize(context).width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: ShapeDecoration(
        color: AppColors.secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => setState(() {
                isClient = false;
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: isClient == false
                      ? AppColors.primaryColor
                      : AppColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const ResponsiveText(
                  text: 'Client',
                  scaleFactor: .04,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => setState(() {
                isClient = true;
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: isClient == true
                      ? AppColors.primaryColor
                      : AppColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const ResponsiveText(
                  text: 'Company',
                  scaleFactor: .04,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
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
