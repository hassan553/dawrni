import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/features/home/widget/company_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/global_function.dart';
import '../../../core/widgets/responsive_text.dart';
import '../../home/views/all_company_view.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSizedBox(value: .01),
            const ResponsiveText(
              text: 'You Favourites ',
              color: AppColors.white,
              scaleFactor: .06,
              fontWeight: FontWeight.bold,
            ),
            const CustomSizedBox(value: .03),
            SizedBox(
              height: 40,
              child: CustomTextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Search your service ..',
                suffixIcons: Image.asset('assets/Search.png'),
              ),
            ),
            const CustomSizedBox(value: .04),
            Expanded(
              flex: 2,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const CompanyWidget(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 4,
              ),
            ),
            const CustomSizedBox(value: .01),
            InkWell(
              onTap: () {},
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: ResponsiveText(
                  text: 'View All >>',
                  color: AppColors.offWhite,
                  scaleFactor: .04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
