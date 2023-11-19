import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 130.w,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category.name, style: context.f20700),
                        const SizedBox(height: 10),
                        Text(category.description, style: context.f12500?.copyWith(height: 1.6)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 130.w,
                  )
                ],
              ),
            ),
          ],
        ),
        PositionedDirectional(
            top: 10,
            end: 0,
            child: Image.asset(category.image, width: 150.w))
      ],
    );
  }
}
