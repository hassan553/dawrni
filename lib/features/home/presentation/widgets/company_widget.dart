import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => navigateTo(CompanyDetailsView()),
      ///TODO: fix navigation
      child: Container(
        width: 100.w,
        height: 100,
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        decoration: ShapeDecoration(
          color: AppColors.secondColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(8.0),
          child: Row(
            children: [
              Container(
                width: 99,
                height: 90,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/Rectangle 43.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ResponsiveText(
                    text: 'Al Husein repairing',
                    scaleFactor: .04,
                    color: AppColors.white,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/im.png',
                        width: 12,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: 5),
                      ResponsiveText(
                        text: 'Apartment repair',
                        scaleFactor: .03,
                        color: AppColors.offWhite,
                      ),
                    ],
                  ),
                  Row(children: [
                    ...List.generate(
                      4,
                      (index) => const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                    ),
                    ResponsiveText(
                      text: '(3)',
                      scaleFactor: .03,
                      color: AppColors.offWhite,
                    ),
                  ]),
                ],
              )),
              const Align(
                alignment: AlignmentDirectional.topEnd,
                child: Icon(
                  Icons.bookmark,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
