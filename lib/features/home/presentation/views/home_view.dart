import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/home/presentation/routes/all_company_route.dart';
import 'package:dawrni/features/home/presentation/widgets/company_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
          const CustomSizedBox(value: .03),
          SizedBox(
            height: 153,
            child: ListView.separated(
              shrinkWrap: true,
              reverse: false,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              itemBuilder: (context, index) => categoryWidget(
                  context,
                  'assets/category2.png',
                  'Legal Service',
                  'Get your problem fixed\nwith our fast service'),
              itemCount: 100,
            ),
          ),
          const CustomSizedBox(value: .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
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
                 onTap: () => context.push(AllCompanyRoute.name),
           
                child: ResponsiveText(
                  text: 'View All >>',
                  color: AppColors.offWhite,
                  scaleFactor: .03,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                10,
                (index) => const CompanyWidget(),
              ),
            ),
          )
              // child: ListView.separated(
              //   itemBuilder: (context, index) => const CompanyWidget(),
              //   separatorBuilder: (context, index) => const SizedBox(height: 8),
              //   itemCount: 5,
              // ),
              ),
        ],
      ),
    );
  }

  SizedBox categoryWidget(
      BuildContext context, String imagePath, String title, String subTitle) {
    return SizedBox(
      width: 90.w,
      height: 153,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 25,
            child: Container(
              width: 85.w,
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

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 8; i++) {
      indicators.add(
        i == 0 ? _buildIndicator(true) : _buildIndicator(false),
      );
    }
    return indicators;
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 3.0,
      width: isActive ? 9 : 5.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.white : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
