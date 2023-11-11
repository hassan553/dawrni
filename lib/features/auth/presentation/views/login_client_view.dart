import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/enums/user_type.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/core/widgets/show_awesomeDialog.dart';
import 'package:dawrni/features/auth/presentation/routes/forget_password_route.dart';
import 'package:dawrni/features/auth/presentation/routes/register_route.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  @override
  void dispose() {
    name.dispose();
    password.dispose();
    phone.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.1),
          image: const DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage(ImagesPaths.splashBackgroundPng),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                topImage(context),
                SizedBox(height: 5.h),
                companyOrClientButton(context),
                SizedBox(height: 5.h),
                enterIfonBody(),
                SizedBox(height: 3.h),
                loginButton(),
                SizedBox(height: 2.h),
                signUpButton()
              ],
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
        Text(
          S.of(context).didntHaveAnyAccount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () => context.pushReplacement(RegisterRoute.name),
          child: Text(
            S.of(context).sign_up_here,
            style: const TextStyle(
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
    //           title: S.of(context).sign_in,
    //         ),
    //       )
    //     : BlocConsumer<AuthCubit, AuthState>(
    //         listener: (context, state) {
    //           if (state is ClientLoginSuccessState) {
    //             print("success login");
    //             // showSnackBarWidget(
    //             //     context: context,
    //             //     message: 'Successfuly Login',
    //             //     requestStates: RequestStates.success);
    //             // navigateOff(const MainView());
    //             ///TODO: fix snackbar
    //             context.go(MainRoute.name);
    //           } else if (state is ClientLoginErrorState) {
    //             print("errrorrrrrrrrrr ${state.error}");
    //             return;
    //           } else if (state is NoInternetConnection) {
    //             showAwesomeDialog(
    //               context: context,
    //               description: "No Internet Connection",
    //               buttonText: 'Check Connection',
    //               status: RequestStates.warrning,
    //             );
    //           } else if (state is AccountExistState) {
    //             showAwesomeDialog(
    //               context: context,
    //               description: "This Account Exist As ${state.message}",
    //               buttonText: 'Try Again',
    //               status: RequestStates.error,
    //             );
    //           }
    //         },
    //         builder: (context, state) => state is ClientLoginLoadingState
    //             ? const CustomLoadingWidget()
    //             : CustomButton(
    //                 function: () {
    //                   if (formKey.currentState!.validate()) {
    //                     AuthCubit.get(context)
    //                         .userLogin(name.text.trim(), password.text.trim());
    //                   }
    //                 },
    //                 color: AppColors.primaryColor,
    //                 textColor: AppColors.white,
    //                 fontSize: .04,
    //                 title: S.of(context).sign_in,
    //               ),
    //       );
  }

  Widget enterIfonBody() {
    return SizedBox();
    // return Form(
    //   key: formKey,
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       CustomTextFieldWidget(
    //         focusNode: emailFocusNode,
    //         onfiledSumbitted: (p0) {
    //           FocusScope.of(context).requestFocus(passwordFocusNode);
    //         },
    //         icon: Image.asset('assets/Group.png'),
    //         controller: name,
    //         valid: (String? value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Not Valid empty value';
    //           } else if (!value.contains('@')) {
    //             return 'not valid email address';
    //           }
    //         },
    //         hintText:
    //             isClient == false ? S.of(context).email : S.of(context).company,
    //       ),
    //       SizedBox(height: 2.h),
    //       // SizedBox(
    //       //   height: 70,
    //       //   child: Row(
    //       //     crossAxisAlignment: CrossAxisAlignment.start,
    //       //     children: [
    //       //       Container(
    //       //         width: 70,
    //       //         height: 47,
    //       //         alignment: Alignment.center,
    //       //         decoration: BoxDecoration(
    //       //           borderRadius: BorderRadius.circular(15),
    //       //           color: AppColors.secondColor,
    //       //         ),
    //       //         child: FittedBox(
    //       //           child: Row(
    //       //             mainAxisSize: MainAxisSize.min,
    //       //             children: [
    //       //               Text(generateCountryFlag(),
    //       //                   style: const TextStyle(fontSize: 18)),
    //       //               const SizedBox(width: 5),
    //       //               Text('+965',
    //       //                   style: TextStyle(
    //       //                       color: AppColors.offWhite, fontSize: 13)),
    //       //             ],
    //       //           ),
    //       //         ),
    //       //       ),
    //       //       const SizedBox(width: 8),
    //       //       Expanded(
    //       //         child: CustomTextFieldWidget(
    //       //           icon: Image.asset('assets/Group.png'),
    //       //           keyboard: TextInputType.number,
    //       //           controller: phone,
    //       //           valid: (String? value) {
    //       //             if (value == null) {
    //       //               return 'Not Valid empty value';
    //       //             } else if (value.length < 11) {
    //       //               return 'not valid phone number';
    //       //             } else {
    //       //               return null;
    //       //             }
    //       //           },
    //       //           hintText: 'Phone Number',
    //       //         ),
    //       //         // child: IntlPhoneField(
    //       //         //   showCountryFlag: false,
    //       //         //   showDropdownIcon: false,
    //       //         //   decoration: InputDecoration(
    //       //         //     hintText: 'Phone Number',
    //       //         //     hintStyle:
    //       //         //         TextStyle(color: AppColors.offWhite, fontSize: 14),
    //       //         //     prefixStyle: TextStyle(color: AppColors.offWhite),
    //       //         //     iconColor: AppColors.white,
    //       //         //     fillColor: AppColors.secondColor,
    //       //         //     filled: true,
    //       //         //     focusedBorder: OutlineInputBorder(
    //       //         //         borderSide:
    //       //         //             const BorderSide(color: AppColors.secondColor),
    //       //         //         borderRadius: BorderRadius.circular(15)),
    //       //         //     border: OutlineInputBorder(
    //       //         //         borderSide:
    //       //         //             const BorderSide(color: AppColors.secondColor),
    //       //         //         borderRadius: BorderRadius.circular(15)),
    //       //         //   ),
    //       //         //   enabled: true,
    //       //         //   style: TextStyle(color: AppColors.offWhite, fontSize: 16),
    //       //         //   textAlignVertical: TextAlignVertical.center,
    //       //         //   cursorColor: AppColors.primaryColor,
    //       //         //   dropdownIcon: Icon(
    //       //         //     Icons.arrow_drop_down,
    //       //         //     color: AppColors.offWhite,
    //       //         //   ),
    //       //         //   dropdownTextStyle:
    //       //         //       TextStyle(color: AppColors.offWhite, fontSize: 16),
    //       //         //   initialCountryCode: 'kw',
    //       //         //   onChanged: (phone) {
    //       //         //     print('phone$phone');
    //       //         //   },
    //       //         // ),
    //       //       ),
    //       //     ],
    //       //   ),
    //       // ),
    //       BlocBuilder<AuthCubit, AuthState>(
    //         builder: (context, state) => CustomTextFieldWidget(
    //           icon: Icon(
    //             CupertinoIcons.lock,
    //             color: AppColors.offWhite,
    //           ),
    //           obscure: AuthCubit.get(context).obscure,
    //           suffixIcons: IconButton(
    //             onPressed: () {
    //               AuthCubit.get(context).changePasswordObscure();
    //             },
    //             icon: Icon(
    //               AuthCubit.get(context).obscure
    //                   ? Icons.visibility_off
    //                   : Icons.visibility,
    //               color: AppColors.offWhite,
    //             ),
    //           ),
    //           controller: password,
    //           valid: (String? value) {
    //             if (value == null) {
    //               return 'Not Valid empty value';
    //             } else if (value.length < 8) {
    //               return 'short password';
    //             }
    //           },
    //           focusNode: passwordFocusNode,
    //           hintText: S.of(context).password,
    //           onChange: (value) {
    //             if (password.text.isEmpty || name.text.isEmpty) {
    //               setState(() {
    //                 isEmpty = true;
    //               });
    //             } else {
    //               setState(() {
    //                 isEmpty = false;
    //               });
    //             }
    //           },
    //         ),
    //       ),
    //       Align(
    //         alignment: AlignmentDirectional.topStart,
    //         child: TextButton(
    //           onPressed: () => context.push(ForgetPasswordRoute.name),
    //           child: Text(
    //             S.of(context).forget_password,
    //             style: TextStyle(
    //               color: AppColors.offWhite,
    //               fontSize: 13,
    //               fontWeight: FontWeight.w700,
    //               decoration: TextDecoration.underline,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget companyOrClientButton(BuildContext context) {
    return SizedBox();
    // return Container(
    //   width: 100.w,
    //   height: 50,
    //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    //   decoration: ShapeDecoration(
    //     color: AppColors.secondColor,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(16),
    //     ),
    //   ),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         child: InkWell(
    //           onTap: () => setState(() {
    //             name.clear();
    //             phone.clear();
    //             password.clear();
    //             CacheStorageServices().setUserType(UserType.client);
    //             isClient = false;
    //             AuthCubit.get(context).cancelState();
    //           }),
    //           child: Container(
    //             height: 50,
    //             alignment: Alignment.center,
    //             padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    //             decoration: ShapeDecoration(
    //               color: isClient == false
    //                   ? AppColors.primaryColor
    //                   : AppColors.secondColor,
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(16),
    //               ),
    //             ),
    //             child: ResponsiveText(
    //               text: S.of(context).client,
    //               scaleFactor: .04,
    //               color: AppColors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: InkWell(
    //           onTap: () => setState(() {
    //             CacheStorageServices().setUserType(UserType.company);
    //             isClient = true;
    //             name.clear();
    //             phone.clear();
    //             password.clear();
    //             AuthCubit.get(context).cancelState();
    //           }),
    //           child: Container(
    //             height: 50,
    //             alignment: Alignment.center,
    //             padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    //             decoration: ShapeDecoration(
    //               color: isClient == true
    //                   ? AppColors.primaryColor
    //                   : AppColors.secondColor,
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(16),
    //               ),
    //             ),
    //             child: ResponsiveText(
    //               text: S.of(context).company,
    //               scaleFactor: .04,
    //               color: AppColors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Image topImage(BuildContext context) {
    return Image.asset(
      ImagesPaths.logPng,
      width: 30.w,
      fit: BoxFit.fill,
    );
  }
}
