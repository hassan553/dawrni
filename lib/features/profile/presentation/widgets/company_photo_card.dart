import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CompanyPhotoCard extends StatelessWidget {
  final int? id;
  final String imageUrl;
  const CompanyPhotoCard({Key? key, this.id, this.imageUrl = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // decoration: BoxDecoration(
          //   border: id == null ? Border.all(color: AppColors.primaryColor) : null
          // ),
          child: id == null ? DottedBorder(
            color: AppColors.primaryColor,
            dashPattern: const [5],
            strokeWidth: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add, color: AppColors.primaryColor),
                const Row(
                  children: [
                    SizedBox(height: 20),
                  ],
                ),
                Text(S.of(context).addImage, style: context.f15400?.copyWith(color: AppColors.primaryColor)),
              ],
            ),
          ) : AppNetworkImage(url: imageUrl),
        ),
        if(id != null)
        PositionedDirectional(
          end: 0,
          child: IconButton(onPressed: () {

          }, icon: const Icon(Icons.remove_circle, color: Colors.red)),
        ),
      ],
    );
  }
}
