import 'package:dawrni/core/core_compoent/app_text_field.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PassowrdField extends StatefulWidget {
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  void Function()? onPressedConfirmPassowrd;

  PassowrdField(
      {super.key,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.onPressedConfirmPassowrd});

  @override
  State<PassowrdField> createState() => _PassowrdFieldState();
}

class _PassowrdFieldState extends State<PassowrdField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
            hintText: 'password',
            controller: widget.passwordController,
            prefixIcon: SvgPicture.asset(
              ImagesPaths.lockIcon,
              fit: BoxFit.scaleDown,
              
            ),
            suffixIcon:  SvgPicture.asset(ImagesPaths.profDone,fit:BoxFit.scaleDown,),
            ),
        AppTextField(
            hintText: 'Confirm Password',
            controller: widget.confirmPasswordController,
            prefixIcon: SvgPicture.asset(
              ImagesPaths.lockIcon,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: IconButton(
                onPressed: widget.onPressedConfirmPassowrd,
                icon: SvgPicture.asset(ImagesPaths.profDone))),
      ],
    );
  }
}
