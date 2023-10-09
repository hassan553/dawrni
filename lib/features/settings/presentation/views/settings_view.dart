import 'package:dawrni/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool notification = true;
  bool update = false;
  bool promotions = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(27.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          topPartText(),
          const SizedBox(height: 60),
          customSwatichButton('General Notification', notification),
          const SizedBox(height: 20),
          customSwatichButton('App Updates', update),
          const SizedBox(height: 20),
          customSwatichButton('Promotions', promotions),
        ]),
      ),
    );
  }

  Row customSwatichButton(String title, bool values) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Switch(
          activeColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.offWhite,
          value: values,
          onChanged: (value) {
            setState(() {
              values = value;
            });
          },
        ),
      ],
    );
  }

  Column topPartText() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General Setting',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: -0.09,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Personalize your experience',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF7B7B7B),
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: -0.06,
          ),
        ),
      ],
    );
  }

  AppBar settingAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        ///TODO: fix navigation
        // onTap: () => pop(),
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
