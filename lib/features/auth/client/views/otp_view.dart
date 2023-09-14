import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  TextEditingController codeController = TextEditingController();
  bool isEmpty = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController.dispose();
  }

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
                text: 'OTP Verification',
                scaleFactor: .06,
                fontWeight: FontWeight.bold,
              ),
              const CustomSizedBox(value: .02),
              FittedBox(
                child: ResponsiveText(
                  text: 'Enter the OTP code sent to +965 546 65874',
                  scaleFactor: .05,
                  color: AppColors.offWhite,
                ),
              ),
              const CustomSizedBox(value: .04),
              PinCodeTextField(
                appContext: context,
                controller: codeController,
                length: 4,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(20),
                  fieldHeight: 40,
                  fieldWidth: 50,
                  activeFillColor: AppColors.secondColor,
                  inactiveColor: AppColors.secondColor,
                  activeColor: AppColors.offWhite,
                  inactiveFillColor: AppColors.secondColor,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    isEmpty = value.isEmpty;
                  });
                },
                onCompleted: (value) {
                  // Handle OTP verification here
                  print("OTP Entered: $value");
                },
              ),
              const CustomSizedBox(value: .04),
              forgetPasswordButton(),
              const CustomSizedBox(value: .03),
              signUpButton()
            ],
          ),
        ),
      )),
    );
  }

  // PinCodeFields otpEnterCode() {
  //   return PinCodeFields(
  //     controller: codeController,
  //     onChange: (value) {
  //       setState(() {
  //         if (value.isEmpty || value.length < 4) {
  //           isEmpty = true;
  //         }
  //       });
  //     },
  //     onComplete: (value) {
  //       setState(() {
  //         isEmpty = false;
  //       });
  //     },
  //     length: 4,
  //     fieldBorderStyle: FieldBorderStyle.leftRight,
  //     responsive: true,
  //     fieldHeight: 50.0,
  //     fieldWidth: 100.0,
  //     borderWidth: 5.0,
  //     activeBorderColor: AppColors.secondColor,
  //     activeBackgroundColor: AppColors.secondColor,
  //     keyboardType: TextInputType.number,
  //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //     autoHideKeyboard: false,
  //     fieldBackgroundColor: AppColors.secondColor,
  //     textStyle: const TextStyle(
  //       fontSize: 30.0,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.red,
  //     ),
  //   );
  // }

  Row signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'If you have an account? ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.20,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign Up here',
            style: TextStyle(
              color: Color(0xFFFF8700),
              fontSize: 14,
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
