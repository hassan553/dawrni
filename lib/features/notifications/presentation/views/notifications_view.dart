import 'package:dawrni/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  children: List.generate(
                    4,
                    (index) => customNotificationWidget(index == 0, index == 3),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Thie Week',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  children: List.generate(
                    4,
                    (index) => customNotificationWidget(index == 0, index == 3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox customNotificationWidget(bool isFirst, bool isLast) {
    return SizedBox(
      height: 100,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isFirst
                    ? Expanded(child: Container())
                    : const Expanded(
                        child: VerticalDivider(
                            color: AppColors.white, thickness: 1)),
                const SizedBox(height: 3),
                const CircleAvatar(
                  radius: 6,
                  backgroundColor: AppColors.primaryColor,
                ),
                const SizedBox(height: 3),
                isLast
                    ? Expanded(child: Container())
                    : const Expanded(
                        child: VerticalDivider(
                            color: AppColors.white, thickness: 1)),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
                child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/Rectangle 43.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Abdullah Alotaibi',
                        style: TextStyle(
                          color: AppColors.offWhite,
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  AppBar settingAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        // onTap: () => pop(),
        ///TODO: fix navigation
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.only(start: 10),
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
    );
  }
}
