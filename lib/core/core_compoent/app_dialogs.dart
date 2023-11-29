import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppDialogs {

  static Future<bool> showConfirmDialog(BuildContext context, {required String text, required String confirmText}) async {
    bool result = false;
    await showDialog(context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.offBlack,
                  borderRadius: BorderRadius.circular(20),
                ),
                  margin: EdgeInsets.only(top: 100.w),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 50.w),
                    Text(text, style: context.f15400, textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                              text: S.of(context).cancel,
                              type: AppButtonType.solidBlack,
                              onPressed: () {
                                context.pop();
                              }),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: AppButton(
                              text: confirmText,
                              type: AppButtonType.solidPrimary,
                              onPressed: () {
                                context.pop(true);
                              }),
                        ),
                      ],
                    )
                  ],),
              ),
              Positioned(
                top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(ImagesPaths.alertPng, height: 200.w)),
            ],
          ),
        ),
      );
    }).then((value) {
      result = value ?? false;
    });
    return result;
  }

}