/// The [LoadingComponent] class is a reusable widget that displays a loading indicator at the center of the screen.
/// It is typically used to indicate that content is being loaded or processed.

import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';

// TODO: customize Loading component view

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  static void showProgressModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: AppColors.offBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const  SizedBox(
                    width: 20,
                  ),
                  const CircularProgressIndicator(color: AppColors.primaryColor),
                  const  SizedBox(
                    width: 20,
                  ),
                  Text(
                    S.of(context).pleaseWait,
                    style: context.f15400,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom + 20.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
  }
}
