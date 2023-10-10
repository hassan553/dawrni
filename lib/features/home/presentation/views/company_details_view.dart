import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_slide_button.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/home/presentation/routes/booking_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompanyDetailsView extends StatelessWidget {
  const CompanyDetailsView({Key? key}) : super(key: key); // Fix the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/is.png',
                  fit: BoxFit.fill,
                  width: 100.w,
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: InkWell(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 50,
                      height: 40,
                      alignment: Alignment.center,
                      // padding: const EdgeInsetsDirectional.all(5),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.10000000149011612),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 75,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 100.w,
                    margin: const EdgeInsets.only(top: 70),
                    height: 100.h - 130,
                    padding: const EdgeInsetsDirectional.only(top: 70),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: ListView(shrinkWrap: true, children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 21),
                        child: topPart(),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ResponsiveText(
                              text: 'About',
                              scaleFactor: .06,
                              fontWeight: FontWeight.w700,
                              color: AppColors.offWhite,
                            ),
                            const SizedBox(height: 18),
                            ResponsiveText(
                              text:
                                  'From minor repairs to major installations, we tackle each project with precision and care, ensuring that your plumbing systems are in optimal condition.',
                              scaleFactor: .04,
                              fontWeight: FontWeight.w300,
                              color: AppColors.offWhite,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 30),
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Container(
                                  width: 90,
                                  height: 90,
                                  margin: const EdgeInsetsDirectional.all(8),
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:
                                          AssetImage("assets/Rectangle 43.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: 100.w,
                              height: 108,
                              margin: const EdgeInsetsDirectional.all(8),
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("assets/imageimage.png"),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            BookBotton(
                              function: () {
                                context.push(BookingRoute.name);
                              },
                              title: 'Book now',
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Positioned(
                    top: 1,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: const CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage('assets/Rectangle 43.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row topPart() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ResponsiveText(
                text: 'Al Husein repairing',
                scaleFactor: .07,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/im.png', width: 16, fit: BoxFit.fill),
                  const SizedBox(width: 8),
                  ResponsiveText(
                    text: 'Apartment repair',
                    scaleFactor: .04,
                    fontWeight: FontWeight.w400,
                    color: AppColors.offWhite,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ResponsiveText(
                    text: '(32)',
                    scaleFactor: .04,
                    fontWeight: FontWeight.w400,
                    color: AppColors.offWhite,
                  ),
                ],
              ),
            ],
          ),
        ),
        Image.asset('assets/imm.png'),
      ],
    );
  }
}
