import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSizedBox(value: .01),
            topPart(),
            const CustomSizedBox(value: .06),
            Column(
              children:
                  List.generate(10, (index) => appointmenteWidget(context)),
            )
          ],
        ),
      ),
    ));
  }

  Container appointmenteWidget(BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsetsDirectional.symmetric(vertical: 10),
      height: 150,
      decoration: ShapeDecoration(
        color: const Color(0xFF3B3B3B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Al Hikma company service',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Law service',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF7B7B7B),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: const Color(0x19FF8700),
                  child: Icon(
                    Icons.check,
                    color: AppColors.offWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 3, color: Color(0xFF7B7B7B)),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset('assets/calendar.png'),
                const SizedBox(width: 8),
                const Text(
                  'Thu, 10 Dec 2023',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF7B7B7B),
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const Spacer(),
                Image.asset('assets/Ellipse 14.png'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column topPart() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today’s Appointments',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
         SizedBox(height: 8),
        Text(
          '2 Pending Appointments',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF7B7B7B),
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
