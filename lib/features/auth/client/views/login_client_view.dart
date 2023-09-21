import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/client/views/forget_password_view.dart';
import 'package:dawrni/features/auth/client/views/register_client_view.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../home/views/main_view.dart';

class LoginClientView extends StatefulWidget {
  const LoginClientView({super.key});

  @override
  State<LoginClientView> createState() => _LoginClientViewState();
}

class _LoginClientViewState extends State<LoginClientView> {
  bool isClient = false;
  bool isEmpty = true;
  final name = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    name.clear();
    password.clear();
    name.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenSize(context).height,
          width: screenSize(context).width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.1),
            image: const DecorationImage(
              alignment: Alignment.bottomCenter,
              image: AssetImage("assets/Asset 1 1.png"),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomSizedBox(value: .04),
                  topImage(context),
                  const CustomSizedBox(value: .08),
                  companyOrClientButton(context),
                  const CustomSizedBox(value: .08),
                  enterIfonBody(),
                  const CustomSizedBox(value: .03),
                  loginButton(),
                  const CustomSizedBox(value: .03),
                  signUpButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Didn’t have any account?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () => navigateTo(const RegisterClientView()),
          child: const Text(
            'Sign Up here',
            style: TextStyle(
              color: Color(0xFFFF8700),
              fontSize: 13,
              fontFamily: 'Montserrat',
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

  Widget loginButton() {
    return isEmpty == true
        ? ColorFiltered(
            colorFilter:
                ColorFilter.mode(AppColors.offWhite, BlendMode.modulate),
            child: CustomButton(
              function: () => navigateTo(MainView()),
              color: AppColors.primaryColor,
              textColor: AppColors.white,
              fontSize: .04,
              title: ' Confirm',
            ),
          )
        : CustomButton(
            function: () => navigateTo(const MainView()),
            color: AppColors.primaryColor,
            textColor: AppColors.white,
            fontSize: .04,
            title: ' Confirm',
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
          SizedBox(
            height: 70,
            child: IntlPhoneField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(color: AppColors.offWhite, fontSize: 14),
                prefixStyle: TextStyle(color: AppColors.offWhite),
                iconColor: AppColors.white,
                fillColor: AppColors.secondColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.secondColor),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.secondColor),
                    borderRadius: BorderRadius.circular(15)),
              ),
              enabled: true,
              style: TextStyle(color: AppColors.offWhite, fontSize: 16),
              textAlignVertical: TextAlignVertical.center,
              cursorColor: AppColors.primaryColor,
              dropdownIcon: Icon(
                Icons.arrow_drop_down,
                color: AppColors.offWhite,
              ),
              dropdownTextStyle:
                  TextStyle(color: AppColors.offWhite, fontSize: 16),
              initialCountryCode: 'Ku',
              onChanged: (phone) {},
            ),
          ),
          // CustomTextFieldWidget(
          //   icon: Icon(
          //     Icons.lock_outline,
          //     color: AppColors.offWhite,
          //   ),
          //   controller: password,
          //   valid: (String? value) {
          //     if (value == null) {
          //       return 'Not Valid empty value';
          //     } else if (value.length < 8) {
          //       return 'short password';
          //     }
          //   },
          //   hintText: 'Password',
          //   onChange: (value) {
          //     if (password.text.isEmpty || name.text.isEmpty) {
          //       setState(() {
          //         isEmpty = true;
          //       });
          //     } else {
          //       setState(() {
          //         isEmpty = false;
          //       });
          //     }
          //   },
          // ),
          // Align(
          //   alignment: AlignmentDirectional.topStart,
          //   child: TextButton(
          //     onPressed: () => navigateTo(const ForgetPassword()),
          //     child: const Text(
          //       'Forget Password ?',
          //       style: TextStyle(
          //         color: AppColors.white,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w700,
          //         decoration: TextDecoration.underline,
          //         height: 1.43,
          //         letterSpacing: 0.20,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget companyOrClientButton(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(MainView()),
      child: Container(
        width: screenSize(context).width,
        height: 50,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
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
      ),
    );
  }

  Image topImage(BuildContext context) {
    return Image.asset(
      'assets/asset-12-1-CWB.png',
      width: screenSize(context).width * .3,
      fit: BoxFit.fill,
    );
  }
}
