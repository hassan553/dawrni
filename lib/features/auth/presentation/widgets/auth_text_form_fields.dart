import 'package:dawrni/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? icon;
  final bool isPass;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon;
  final EdgeInsets? padding;
  final bool readOnly;
  final void Function(String)? onChanged;

  const AuthTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.icon,
    this.keyboardType,
    this.isPass = false,
    this.validator,
    this.borderRadius,
    this.padding,
    this.prefixIcon,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AuthTextFormFieldState createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 1.5.h),
      child: TextFormField(
        onChanged: widget.onChanged,
        style: const TextStyle(color: AppColors.black),
        readOnly: widget.readOnly,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.icon ??
              (widget.isPass
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _hide = !_hide;
                        });
                      },
                      icon: _hide
                          ? Icon(
                              Icons.visibility_off,
                              size: 18.sp,
                            )
                          : Icon(
                              Icons.visibility,
                              size: 18.sp,
                            ))
                  : null),
          isDense: true,
        ),
        obscureText: widget.isPass && _hide,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
