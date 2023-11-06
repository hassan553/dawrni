import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/presentation/routes/login_client_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/paths/images_paths.dart';
import '../../../../core/widgets/custom_text_filed.dart';
import '../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../core/widgets/snack_bar_widget.dart';
import '../../../../generated/l10n.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  bool isEmpty = true;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: 100.h,
        decoration: const BoxDecoration(
          color: AppColors.offBlack,
          image: DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage(ImagesPaths.splashBackgroundPng),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                topImage(context),
                SizedBox(height: 5.h),
                ResponsiveText(
                  text: S.of(context).passwordConfirmation,
                  scaleFactor: .06,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 5.h),
                ResponsiveText(
                  text: S.of(context).yourPasswordWillBeYourKeyToSecureAccessIn,
                  scaleFactor: .04,
                  color: AppColors.offWhite,
                ),
                SizedBox(height: 5.h),
                enterIinfo(),
                SizedBox(height: 3.h),
                forgetPasswordButton(),
                SizedBox(height: 2.h),
                signUpButton()
              ],
            ),
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
              controller: email,
              valid: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Not Valid empty value';
                } else if (!value.contains('@')) {
                  return 'Not Valid Email Address';
                }
              },
              hintText: S.of(context).email),
          // const CustomSizedBox(value: .02),
          // CustomTextFieldWidget(
          //     icon: Icon(
          //       Icons.lock_outline,
          //       color: AppColors.offWhite,
          //     ),
          //     controller: confirmPassword,
          //     onChange: (value) {
          //       if (password.text.isEmpty || confirmPassword.text.isEmpty) {
          //         setState(() {
          //           isEmpty = true;
          //         });
          //       } else {
          //         setState(() {
          //           isEmpty = false;
          //         });
          //       }
          //     },
          //     valid: (String? value) {
          //       if (value == null) {
          //         return 'Not Valid empty value';
          //       } else if (value != password.text) {
          //         return 'write valid password';
          //       }
          //     },
          //     obscure: true,
          //     hintText: 'Confirm Password'),
        ],
      ),
    );
  }

  Row signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).if_you_have_account,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.20,
          ),
        ),
        TextButton(
          onPressed: () => context.push(LoginClientRoute.name),
          child: Text(
            S.of(context).sign_in_here,
            style: const TextStyle(
              color: AppColors.primaryColor,
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
    return SizedBox();
    // return isEmpty == true
    //     ? ColorFiltered(
    //         colorFilter:
    //             ColorFilter.mode(AppColors.offWhite, BlendMode.modulate),
    //         child: CustomButton(
    //           function: () {
    //             if (formKey.currentState!.validate()) {
    //               setState(() {
    //                 isEmpty = false;
    //               });
    //             }
    //           },
    //           color: AppColors.primaryColor,
    //           textColor: AppColors.white,
    //           fontSize: .04,
    //           title: S.of(context).sendEmail,
    //         ),
    //       )
    //     : BlocConsumer<AuthCubit, AuthState>(
    //         listener: (context, state) {
    //           if (state is ChangePasswordSuccessState) {
    //             showSnackBarWidget(
    //                 context: context,
    //                 message: ' Password Reset Email Send To You ',
    //                 requestStates: RequestStates.success);
    //             context.go(LoginClientRoute.name);
    //           } else if (state is ChangePasswordErrorState) {
    //             showAwesomeDialog(
    //               context: context,
    //               description: 'An Error Occure ,Try Again',
    //               buttonText: 'Try Again',
    //             );
    //           }
    //         },
    //         builder: (context, state) => state is ChangePasswordLoadingState
    //             ? const Center(
    //                 child: CustomLoadingWidget(),
    //               )
    //             : CustomButton(
    //                 function: () {
    //                   if (formKey.currentState!.validate()) {
    //                     AuthCubit.get(context)
    //                         .changePassword(email.text.trim());
    //                   }
    //                 },
    //                 color: AppColors.primaryColor,
    //                 textColor: AppColors.white,
    //                 fontSize: .04,
    //                 title: S.of(context).sendEmail,
    //               ),
    //       );
  }

  Image topImage(BuildContext context) {
    return Image.asset(
      ImagesPaths.logPng,
      width: 30.w,
      fit: BoxFit.fill,
    );
  }
}
