import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/enums/user_type.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/extension/ui_extensions/container_decoration.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/utils/app_validator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/auth/presentation/routes/otp_verify_route.dart';
import 'package:dawrni/features/auth/presentation/widgets/top_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  UserType userType = UserType.client;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocListener<RegisterBloc, BaseState<UserEntity>>(
        listener: (context, state) {
          if (state.isSuccess) {
            showToast(message: S.of(context).verificationCodeHasBeenSentToYourEmail);
            context.go(OtpVerifyRoute.name, extra: emailController.text);
          } else if (state.isError) {
            FailureComponent.handleFailure(
                context: context, failure: state.failure);
          }
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: Theme.of(context).authDecoration,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const TopLogo(),
                  const SizedBox(height: 30),
                  companyOrClientButton(context),
                  const SizedBox(height: 50),
                  buildForm(),
                  SizedBox(height: 3.h),
                  buildButton(context),
                  SizedBox(height: 2.h),
                  signInButton()
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget buildButton(BuildContext context) {
    return BlocBuilder<RegisterBloc, BaseState<UserEntity>>(
        builder: (context, state) {
      return AppButton(
        text: S.of(context).signUp,
        onPressed: () => _registerTapped(context),
        loading: state.isLoading,
      );
    });
  }

  Row signInButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).if_you_have_account,
          style: context.f14400,
        ),
        TextButton(
          onPressed: () => context.push(LoginRoute.name),
          child: Text(
            S.of(context).sign_in_here,
            style: context.f14700?.copyWith(
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  void _registerTapped(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      context.read<RegisterBloc>().add(RegisterButtonTappedEvent(
          email: emailController.text,
          password: passwordController.text,
          type: userType));
    }
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            labelText: S.of(context).email,
            controller: emailController,
            hintText: S.of(context).emailHint,
            validator: AppValidator(validators: [
              InputValidator.requiredField,
              InputValidator.email
            ]).validate,
            prefixIcon: Image.asset(ImagesPaths.personPng),
          ),
          AppTextField(
            labelText: S.of(context).password,
            controller: passwordController,
            hintText: S.of(context).passwordHint,
            password: true,
            validator: AppValidator(minLength: 8, validators: [
              InputValidator.requiredField,
              InputValidator.minLength
            ]).validate,
          ),
        ],
      ),
    );
  }

  Widget companyOrClientButton(BuildContext context) {
    return Container(
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
                userType = UserType.client;
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: userType.isClient
                      ? AppColors.primaryColor
                      : AppColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  S.of(context).client,
                  style: userType == UserType.client
                      ? context.f16700
                      : context.f14400?.copyWith(color: AppColors.lightGrey),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => setState(() {
                userType = UserType.company;
              }),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: ShapeDecoration(
                  color: userType.isCompany
                      ? AppColors.primaryColor
                      : AppColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  S.of(context).company,
                  style: userType == UserType.company
                      ? context.f16700
                      : context.f14400?.copyWith(color: AppColors.lightGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
