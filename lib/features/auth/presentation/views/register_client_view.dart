import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/enums/user_type.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/widgets/custom_button.dart';

import 'package:dawrni/core/widgets/custom_loading_widget.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dawrni/features/auth/presentation/routes/login_client_route.dart';
import 'package:dawrni/features/auth/presentation/routes/verify_email_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/show_awesomeDialog.dart';
import '../../../../generated/l10n.dart';

class RegisterClientView extends StatefulWidget {
  const RegisterClientView({super.key});

  @override
  State<RegisterClientView> createState() => _RegisterClientViewState();
}

class _RegisterClientViewState extends State<RegisterClientView> {
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
                companyOrClientButton(context),
                SizedBox(height: 5.h),
                enterIfonBody(),
                SizedBox(height: 3.h),
                registerButton(),
                SizedBox(height: 2.h),
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
              title: S.of(context).signUp,
            ),
          )
        : CacheStorageServices().isClient
            ? BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ClientRegisterSuccessState) {
                    // showSnackBarWidget(
                    //     context: context,
                    //     message: 'Successfuly Create User Account',
                    //     requestStates: RequestStates.success);
                    ///TODO: fix snack bar
                    context.push(VerifyEmailRoute.name);
                  } else if (state is ClientRegisterErrorState) {
                    // showAwesomeDialog(
                    //   context: context,
                    //   description: state.error,
                    //   buttonText: 'Try Again',
                    // );
                    ///TODO: fix snack bar
                    print("error ${state.error}");
                  } else if (state is NoInternetConnection) {
                    // showAwesomeDialog(
                    //   context: context,
                    //   description: "No Internet Connection",
                    //   buttonText: 'Check Connection',
                    //   status: RequestStates.warrning,
                    // );
                    ///TODO: fix snack bar
                    print("no internet");
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
                        title: S.of(context).signUp,
                      ),
              )
            : BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is CompanyRegisterSuccessState) {
                    // showSnackBarWidget(
                    //     context: context,
                    //     message: 'Successfuly Create User Account',
                    //     requestStates: RequestStates.success);
                    ///TODO: fix snack bar
                    context.push(VerifyEmailRoute.name);
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
                            title: S.of(context).signUp,
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
            hintText: CacheStorageServices().isCompany
                ? S.of(context).company_name
                : S.of(context).full_name,
          ),
          SizedBox(height: 2.h),
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
            hintText: S.of(context).email,
          ),
          SizedBox(height: 2.h),
          Visibility(
            visible: CacheStorageServices().isCompany,
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
                SizedBox(height: 2.h),
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
                SizedBox(height: 2.h),
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
              hintText: S.of(context).password,
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
      width: 100.w,
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
                CacheStorageServices().setUserType(UserType.client);
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: CacheStorageServices().isClient
                      ? AppColors.primaryColor
                      : AppColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: ResponsiveText(
                  text: S.of(context).client,
                  scaleFactor: .04,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => setState(() {
                CacheStorageServices().setUserType(UserType.company);
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: CacheStorageServices().isCompany
                      ? AppColors.primaryColor
                      : AppColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: ResponsiveText(
                  text: S.of(context).company,
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
      ImagesPaths.logPng,
      width: 30.w,
      fit: BoxFit.fill,
    );
  }
}
