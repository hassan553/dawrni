import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_button.dart';
import 'package:dawrni/core/widgets/custom_dailog.dart';
import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/client/controller/client_auth_controller.dart';
import 'package:dawrni/features/auth/client/views/login_client_view.dart';
import 'package:dawrni/features/auth/client/views/otp_register_view.dart';
import 'package:dawrni/features/auth/client/views/verify_email.dart';
import 'package:dawrni/features/auth/cubit/auth_cubit.dart';
import 'package:dawrni/features/home/views/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/contants/constants.dart';
import '../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../core/widgets/snack_bar_widget.dart';
import '../../../../main.dart';
import '../cubit/phone_auth_cubit.dart';

class RegisterClientView extends StatefulWidget {
  const RegisterClientView({super.key});

  @override
  State<RegisterClientView> createState() => _RegisterClientViewState();
}

class _RegisterClientViewState extends State<RegisterClientView> {
  final controller = Get.put(ClientAuthController());
  String selectedValue = 'Bokhour and Perfumes';
  List<String> dropdownItems = [
    'Bokhour and Perfumes',
    'Legal Service',
    'Clinics Service',
    'Pets Service',
    'Video games',
    'Food and Beverages',
    'Salons Service',
    'The Mall Service',
    'Out  ors Service',
    'Cars Service',
  ];
  bool isEmpty = true;
  final name = TextEditingController();
  final license = TextEditingController();
  final companyService = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final licenseFocusNode = FocusNode();
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    license.dispose();
    companyService.dispose();
    licenseFocusNode.dispose();
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

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
          onPressed: () => navigateTo(const LoginClientView()),
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

  Widget registerButton() {
    return isEmpty == true
        ? ColorFiltered(
            colorFilter:
                ColorFilter.mode(AppColors.offWhite, BlendMode.modulate),
            child: CustomButton(
              function: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    isEmpty = false;
                  });
                }
              },
              color: AppColors.primaryColor,
              textColor: AppColors.white,
              fontSize: .04,
              title: ' Sign Up',
            ),
          )
        : sharedPreferences.getBool(kIsCompany) == false
            ? BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ClientRegisterSuccessState) {
                    showSnackBarWidget(
                        context: context,
                        message: 'Successfuly Create User Account',
                        requestStates: RequestStates.success);
                    navigateTo(const VerifyEmail());
                  } else if (state is ClientRegisterErrorState) {
                    showAwesomeDialog(
                      context: context,
                      description: state.error,
                      buttonText: 'Try Again',
                    );
                  } else if (state is NoInternetConnection) {
                    showAwesomeDialog(
                      context: context,
                      description: "No Internet Connection",
                      buttonText: 'Check Connection',
                      status: RequestStates.warrning,
                    );
                  }
                },
                builder: (context, state) => state is ClientRegisterLoadingState
                    ? const CustomLoadingWidget()
                    : CustomButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            AuthCubit.get(context).userRegister(
                                name.text.trim(),
                                email.text.trim(),
                                password.text.trim());
                          }
                        },
                        color: AppColors.primaryColor,
                        textColor: AppColors.white,
                        fontSize: .04,
                        title: ' Sign Up',
                      ),
              )
            : BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is CompanyRegisterSuccessState) {
                    showSnackBarWidget(
                        context: context,
                        message: 'Successfuly Create User Account',
                        requestStates: RequestStates.success);
                    navigateTo(const VerifyEmail());
                  } else if (state is CompanyRegisterErrorState) {
                    showAwesomeDialog(
                      context: context,
                      description: state.error,
                      buttonText: 'Try Again',
                    );
                  } else if (state is NoInternetConnection) {
                    showAwesomeDialog(
                      context: context,
                      description: "No Internet Connection",
                      buttonText: 'Check Connection',
                      status: RequestStates.warrning,
                    );
                  }
                },
                builder: (context, state) =>
                    state is CompanyRegisterLoadingState
                        ? const CustomLoadingWidget()
                        : CustomButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                AuthCubit.get(context).companyRegister(
                                  category: selectedValue,
                                  email: email.text,
                                  license: license.text,
                                  name: name.text,
                                  password: password.text,
                                );
                              }
                            },
                            color: AppColors.primaryColor,
                            textColor: AppColors.white,
                            fontSize: .04,
                            title: ' Sign Up',
                          ),
              );
  }

  Form enterIfonBody() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFieldWidget(
            onfiledSumbitted: (p0) {
              FocusScope.of(context).requestFocus(emailFocusNode);
            },
            focusNode: nameFocusNode,
            icon: Image.asset('assets/Group.png'),
            controller: name,
            valid: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Not Valid empty value';
              }
            },
            hintText: sharedPreferences.getBool(kIsCompany) == true
                ? 'Company'
                : 'Full name',
          ),
          const CustomSizedBox(value: .02),

          CustomTextFieldWidget(
            focusNode: emailFocusNode,
            onfiledSumbitted: (p0) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            icon: Icon(
              Icons.email_outlined,
              color: AppColors.offWhite,
            ),
            controller: email,
            valid: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Not Valid empty value';
              } else if (!value.contains('@')) {
                return 'not valid email';
              }
            },
            hintText: 'Email Address',
          ),
          const CustomSizedBox(value: .02),

          Visibility(
            visible: sharedPreferences.getBool(kIsCompany) == true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFieldWidget(
                  icon: Image.asset('assets/Group 34220.png'),
                  controller: license,
                  valid: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Not Valid empty value';
                    }
                  },
                  hintText: 'Compnay License ID',
                ),
                const CustomSizedBox(value: .02),
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    dropdownColor: AppColors.secondColor,
                    icon: Image.asset('assets/Group 34146.png'),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/im.png'),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              item,
                              style: const TextStyle(color: AppColors.white),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const CustomSizedBox(value: .02),
              ],
            ),
          ),

          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) => CustomTextFieldWidget(
              icon: Icon(
                CupertinoIcons.lock,
                color: AppColors.offWhite,
              ),
              obscure: AuthCubit.get(context).obscure,
              suffixIcons: IconButton(
                onPressed: () {
                  AuthCubit.get(context).changePasswordObscure();
                },
                icon: Icon(
                  AuthCubit.get(context).obscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.offWhite,
                ),
              ),
              focusNode: passwordFocusNode,
              controller: password,
              valid: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Not Valid empty value';
                } else if (value.length < 8) {
                  return 'Short Password';
                }
              },
              hintText: 'Password',
            ),
          ),
          // SizedBox(
          //   height: 70,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         width: 70,
          //         height: 47,
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           color: AppColors.secondColor,
          //         ),
          //         child: FittedBox(
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Text(generateCountryFlag(),
          //                   style: const TextStyle(fontSize: 18)),
          //               const SizedBox(width: 5),
          //               Text('+965',
          //                   style: TextStyle(
          //                       color: AppColors.offWhite, fontSize: 13)),
          //             ],
          //           ),
          //         ),
          //       ),
          //       const SizedBox(width: 8),
          //       Expanded(
          //         child: CustomTextFieldWidget(
          //           icon: Image.asset('assets/Group.png'),
          //           keyboard: TextInputType.number,
          //           controller: email,
          //           valid: (String? value) {
          //             if (value == null) {
          //               return 'Not Valid empty value';
          //             } else if (value.length < 11) {
          //               return 'not valid phone number';
          //             } else {
          //               return null;
          //             }
          //           },
          //           hintText: 'Phone Number',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget companyOrClientButton(BuildContext context) {
    return Container(
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
                sharedPreferences.setBool(kIsCompany, false);
                print("value client ${sharedPreferences.getBool(kIsCompany)}");
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: sharedPreferences.getBool(kIsCompany) == false
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
                sharedPreferences.setBool(kIsCompany, true);
                print("value company ${sharedPreferences.getBool(kIsCompany)}");
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: sharedPreferences.getBool(kIsCompany) == true
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
      'assets/asset-12-1-CWB.png',
      width: screenSize(context).width * .3,
      fit: BoxFit.fill,
    );
  }
}
