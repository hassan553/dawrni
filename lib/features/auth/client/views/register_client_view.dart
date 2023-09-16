import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/client/views/login_client_view.dart';
import 'package:dawrni/features/auth/client/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterClientView extends StatefulWidget {
  const RegisterClientView({super.key});

  @override
  State<RegisterClientView> createState() => _RegisterClientViewState();
}

class _RegisterClientViewState extends State<RegisterClientView> {
  bool isCompany = false;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: screenSize(context).height,
        decoration:const  BoxDecoration(
          color: Color(0xff262626),
          image:  DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage("assets/Asset 1 1.png"),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomSizedBox(value: .04),
                topImage(context),
                const CustomSizedBox(value: .1),
                companyOrClientButton(context),
                const CustomSizedBox(value: .08),
                enterIfonBody(),
                const CustomSizedBox(value: .03),
                registerButton(),
                const CustomSizedBox(value: .03),
                signUpButton()
              ],
            ),
          ),
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
          onPressed: () => navigateTo(LoginClientView()),
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
      function: () => navigateTo(OTPView()),
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
            hintText: isCompany == false ? 'Full name' : 'Company',
          ),
          const CustomSizedBox(value: .02),
          Visibility(
            visible: isCompany,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFieldWidget(
                  suffixIcons: Image.asset('assets/Group 34146.png'),
                  icon: Image.asset('assets/im.png'),
                  controller: name,
                  valid: (String? value) {
                    if (value == null) {
                      return 'Not Valid empty value';
                    }
                  },
                  hintText:
                      isCompany == false ? 'Full name' : 'Service Company',
                ),
                const CustomSizedBox(value: .02),
              ],
            ),
          ),
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
          )
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
                isCompany = false;
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: isCompany == false
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
                isCompany = true;
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: isCompany == true
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
