import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/home/views/all_company_view.dart';
import 'package:dawrni/features/home/widget/company_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/customAppBar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSizedBox(value: .04),
          const ResponsiveText(
            text: 'Let’s Find What',
            color: AppColors.white,
            scaleFactor: .06,
            fontWeight: FontWeight.bold,
          ),
          const CustomSizedBox(value: .01),
          const ResponsiveText(
            text: 'You Need !',
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
          const CustomSizedBox(value: .02),
          SizedBox(
            height: 153,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.antiAlias,
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              itemBuilder: (context, index) => categoryWidget(
                  context,
                  'assets/category2.png',
                  'Legal Service',
                  'Get your problem fixed\nwith our fast service'),
              itemCount: 100,
            ),
          ),
          const CustomSizedBox(value: .04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ResponsiveText(
                text: 'Our Best Services',
                color: AppColors.white,
                scaleFactor: .04,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                onTap: () => navigateTo(const AllCompanyView()),
                child: ResponsiveText(
                  text: 'View All >>',
                  color: AppColors.offWhite,
                  scaleFactor: .04,
                ),
              ),
            ],
          ),
          const CustomSizedBox(value: .02),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const CompanyWidget(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox categoryWidget(
      BuildContext context, String imagePath, String title, String subTitle) {
    return SizedBox(
      width: screenSize(context).width * .9,
      height: 153,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 25,
            child: Container(
              width: screenSize(context).width * .85,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryColor,
              ),
              padding: const EdgeInsetsDirectional.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResponsiveText(
                      text: title,
                      scaleFactor: .06,
                      fontWeight: FontWeight.bold,
                    ),
                    const CustomSizedBox(value: .02),
                    ResponsiveText(
                      text: subTitle,
                      scaleFactor: .04,
                    ),
                  ]),
            ),
          ),
          Positioned(
            left: 183,
            top: 0,
            child: Container(
              width: 165,
              height: 128,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.51),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
