import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/failuer_component.dart';
import 'package:dawrni/core/core_compoent/show_toast.dart';
import 'package:dawrni/core/enums/app_state.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/extension/ui_extensions/container_decoration.dart';
import 'package:dawrni/core/utils/app_validator.dart';
import 'package:dawrni/core/utils/base_state.dart';
import 'package:dawrni/features/auth/domain/entities/user_entity.dart';
import 'package:dawrni/features/auth/domain/entities/verify_email_code_entity.dart';
import 'package:dawrni/features/auth/presentation/blocs/verify_email/verify_email_bloc.dart';
import 'package:dawrni/features/auth/presentation/widgets/top_logo.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:dawrni/generated/l10n.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyView extends StatefulWidget {
  final UserEntity user;

  const OtpVerifyView({super.key, required this.user});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  final formKey = GlobalKey<FormState>();

  final codeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocListener<AppConfigBloc, AppConfigState>(
            listener: (context, state) {
              if (state.appState == AppState.loggedIn) {
                WidgetsBinding.instance.addPostFrameCallback(
                      (timeStamp) {
                    context.go(MainRoute.name);
                  },
                );
              }
            },
  child: BlocListener<VerifyEmailBloc, BaseState<VerifyEmailCodeEntity>>(
            listener: (context, state) {
              if (state.isSuccess) {
                showToast(message: S.of(context).verifiedSuccessfully);
                context.read<AppConfigBloc>().add(LogInEvent(user: widget.user));
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
                const SizedBox(height: 50),
                Text(S.of(context).otpVerification, style: context.f20700),
                const SizedBox(height: 20),
                Text(S.of(context).enterTheOtpCodeSentToNumber(widget.user.email), style: context.f14400?.copyWith(height: 1.6), textAlign: TextAlign.center),
                const SizedBox(height: 50),
                buildForm(),
                const SizedBox(height: 30),
                buildButton(context),
                SizedBox(height: 2.h)
              ],
            ),
          ),
        ),
      ),
),
)),
    );
  }

  Widget buildButton(BuildContext context) {
    return BlocBuilder<AppConfigBloc, AppConfigState>(
  builder: (ctx, appState) {
    return BlocBuilder<VerifyEmailBloc, BaseState<VerifyEmailCodeEntity>>(
        builder: (context, state) {
      return AppButton(
        text: S.of(context).confirm,
        onPressed: () => _confirmTapped(context),
        loading: state.isLoading || appState.loading,
      );
    });
  },
);
  }

  void _confirmTapped(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      context.read<VerifyEmailBloc>().add(VerifyEmailButtonTappedEvent(email: widget.user.email, code: codeController.text));
    }
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          appContext: context,
          controller: codeController,
          length: 4,
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
          validator: AppValidator(
            minLength: 4,
            validators: [
              InputValidator.requiredField,
              InputValidator.minLength,
            ]
          ).validate,
          onCompleted: (value) {
            if (value.length == 6) {

            }
          },
        ),
      ),
    );
  }
}
