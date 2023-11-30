import 'package:dawrni/core/enums/app_state.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/extension/ui_extensions/container_decoration.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:dawrni/features/auth/presentation/routes/otp_verify_route.dart';
import 'package:dawrni/features/auth/presentation/widgets/top_logo.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/core_compoent/app_button.dart';
import '../../../../core/core_compoent/app_text_field.dart';
import '../../../../core/core_compoent/failuer_component.dart';
import '../../../../core/core_compoent/show_toast.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../routes/register_route.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isEmpty = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => sl<LoginBloc>(),
        child: BlocListener<AppConfigBloc, AppConfigState>(
          listener: (context, state) {
            if (state.appState == AppState.loggedIn) {
              context.go(MainRoute.name);
            }
          },
          child: BlocListener<LoginBloc, BaseState<UserEntity>>(
            listener: (context, state) {
              if (state.isSuccess) {
                showToast(message: S.of(context).signedInSuccessfully);
                if(state.data!.isVerified) {
                  context.read<AppConfigBloc>().add(LogInEvent(user: state.data!));
                } else {
                  context.push(OtpVerifyRoute.name, extra: state.data!);
                }
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
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      const TopLogo(),
                      const SizedBox(height: 50),
                      buildForm(),
                      SizedBox(height: 3.h),
                      buildButton(context),
                      SizedBox(height: 2.h),
                      signUpButton()
                    ],
                  ),
                ),
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
        Text(
          S.of(context).didntHaveAnyAccount,
          style: context.f14400,
        ),
        TextButton(
          onPressed: () => context.go(RegisterRoute.name),
          child: Text(
            S.of(context).sign_up_here,
            style: context.f14700?.copyWith(
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context) {
    return BlocBuilder<AppConfigBloc, AppConfigState>(
  builder: (ctx, appState) {
    return BlocBuilder<LoginBloc, BaseState<UserEntity>>(
        builder: (context, state) {
      return state.isLoading
          ? const CustomLoadingWidget()
          : AppButton(
              text: S.of(context).sign_in,
              onPressed: () {
                _loginTapped(context);
              },
              loading: state.isLoading || appState.loading,
            );
    });
  },
);
  }

  void _loginTapped(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(LoginButtonTappedEvent(
            email: emailController.text,
            password: passwordController.text,
          ));
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
          const SizedBox(height: 10),
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
          Align(
            alignment: AlignmentDirectional.topStart,
            child: TextButton(
              onPressed: () {
                ///todo: implement this
                // context.push(ForgetPasswordRoute.name);
              },
              child: Text(
                S.of(context).forget_password,
                style: context.f14700?.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline),
              ),
            ),
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
              onTap: () => setState(() {}),
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
              onTap: () => setState(() {}),
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
}
