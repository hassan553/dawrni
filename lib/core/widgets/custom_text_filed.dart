import 'package:dawrni/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic keyboard;
  final dynamic icon;
  final dynamic suffixIcons;
  final dynamic valid;
  final bool obscure;
  final FocusNode? focusNode;
  final void Function(String)? onChange;
  final void Function(String)? onfiledSumbitted;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscure = false,
    this.autovalidateMode,
    this.icon,
    this.keyboard,
    this.suffixIcons,
    this.valid,
    this.maxLines,
    this.onChange,
    this.focusNode,
    this.onfiledSumbitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      validator: valid,
      onChanged: onChange,
      
      onFieldSubmitted: onfiledSumbitted,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: maxLines ?? 1,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.white,
      style: const TextStyle(color: AppColors.white),
      obscureText: obscure,
      keyboardType: keyboard,
      focusNode: focusNode,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsetsDirectional.only(top: 8, start: 20, end: 15),
        filled: true,
        hintText: hintText,
        fillColor: AppColors.secondColor,
        prefixIcon: icon,
        suffixIcon: suffixIcons,
        hintStyle: TextStyle(color: AppColors.white.withOpacity(.6)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.secondColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.secondColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
