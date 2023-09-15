import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_slide_button.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  int selectIndex = -1;
  List<DayModel> dayList = [
    DayModel(title: 'Sat', number: '19'),
    DayModel(title: 'Sat', number: '20'),
    DayModel(title: 'Sat', number: '12'),
    DayModel(title: 'Sat', number: '10'),
    DayModel(title: 'Sat', number: '11'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenSize(context).height,
        child: Stack(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/is.png',
                  fit: BoxFit.fill,
                  width: screenSize(context).width,
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: InkWell(
                    onTap: () => pop(),
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
                    width: screenSize(context).width,
                    margin: const EdgeInsets.only(top: 70),
                    height: screenSize(context).height - 130,
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
                          child: topPart()),
                      const SizedBox(height: 40),
                      //day row widget
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 21),
                        child: Row(
                          children: List.generate(
                            dayList.length,
                            (index) => InkWell(
                              onTap: () => setState(() {
                                selectIndex = index;
                              }),
                              child: dayWidget(dayList[index].title,
                                  dayList[index].number, index),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            const ResponsiveText(
                              text: 'When would you like your service?',
                              scaleFactor: .04,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 15),
                            Column(
                              children: List.generate(
                                  4, (index) => hourWidget(context)),
                            ),
                            const SizedBox(height: 30),
                            const BookBotton(title: 'Confrim date and time'),
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

  Widget hourWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 6),
      child: SizedBox(
        width: screenSize(context).width,
        height: 39,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 39,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  '09:30 AM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 39,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.10000000149011612),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  '10:30 AM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dayWidget(String title, String number, int index) {
    return Container(
      width: 48,
      height: 45,
      margin: const EdgeInsetsDirectional.only(end: 8),
      padding: const EdgeInsetsDirectional.symmetric(vertical: 2),
      decoration: ShapeDecoration(
        color: selectIndex == index
            ? const Color(0x19FF8700)
            : Colors.white.withOpacity(0.10000000149011612),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color:
                  selectIndex == index ? AppColors.primaryColor : Colors.white,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.25,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              color:
                  selectIndex == index ? AppColors.primaryColor : Colors.white,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.40,
            ),
          ),
        ],
      ),
    );
  }

  Widget topPart() {
    return const ResponsiveText(
      text: 'Al Husein repairing',
      scaleFactor: .07,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.start,
      color: AppColors.white,
    );
  }
}

class DayModel {
  final String title, number;
  DayModel({required this.title, required this.number});
}
