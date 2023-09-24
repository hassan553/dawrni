import 'package:dawrni/core/contants/constants.dart';
import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/client/controller/client_auth_controller.dart';
import 'package:dawrni/features/auth/client/cubit/phone_auth_cubit.dart';
import 'package:dawrni/features/auth/client/views/register_client_view.dart';
import 'package:dawrni/features/home/views/main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/widgets/custom_dailog.dart';
//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class OTPLoginView extends StatefulWidget {
  final String phone;
  const OTPLoginView({super.key, required this.phone});

  @override
  State<OTPLoginView> createState() => _OTPLoginViewState();
}

class _OTPLoginViewState extends State<OTPLoginView> {
  final controller = Get.find<ClientAuthController>();
  TextEditingController codeController = TextEditingController();
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: screenSize(context).height,
        decoration: const BoxDecoration(
          color: Color(0xff262626),
          image: DecorationImage(
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
                const ResponsiveText(
                  text: 'OTP Verification',
                  scaleFactor: .06,
                  fontWeight: FontWeight.bold,
                ),
                const CustomSizedBox(value: .02),
                FittedBox(
                  child: ResponsiveText(
                    text: 'Enter the OTP code sent to ${widget.phone}',
                    scaleFactor: .05,
                    color: AppColors.offWhite,
                  ),
                ),
                const CustomSizedBox(value: .07),
                BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
                  listener: (context, state) {
                    if (state is PhoneOTPVerified) {
                      navigateOff(const MainView());
                    } else if (state is ErrorOccurred) {
                      showDailog(state.errorMsg);
                    }
                  },
                  builder: (context, state) => PinCodeTextField(
                    appContext: context,
                    controller: codeController,
                    length: 6,
                    textStyle: const TextStyle(color: Colors.white),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: AppColors.secondColor,
                      inactiveColor: AppColors.secondColor,
                      selectedColor: AppColors.secondColor,
                      activeColor: AppColors.offWhite,
                      selectedFillColor: AppColors.secondColor,
                      inactiveFillColor: AppColors.secondColor,
                    ),
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        isEmpty = value.isEmpty;
                      });
                    },
                    onCompleted: (value) {
                      if (value.length == 6) {
                        PhoneAuthCubit.get(context).submitOTPForLogin(value);
                      }
                    },
                  ),
                ),
                const CustomSizedBox(value: .03),
                forgetPasswordButton(),
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
          'If you have an account?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
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
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
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
            function: () {
              PhoneAuthCubit.get(context)
                  .submitOTPForLogin(codeController.text);
            },
            color: AppColors.primaryColor,
            textColor: AppColors.white,
            fontSize: .04,
            title: ' Confirm',
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
