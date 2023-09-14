import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Icon(Icons.add),
              //     const Spacer(),
              //     Icon(Icons.add),
              //   ],
              // ),
              Container(
                width: 64,
                height: 64,
                margin: const EdgeInsetsDirectional.only(start: 15),
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/Rectangle 18.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 15),
                child: ResponsiveText(
                  text: 'Hey 👋 Abdullah',
                  color: AppColors.white,
                  scaleFactor: .04,
                ),
              ),
              const CustomSizedBox(value: .1),
              customListTile(
                  'Home',
                  Icon(
                    Icons.home,
                    color: AppColors.offWhite,
                    size: 30,
                  )),
              customListTile(
                  'About us',
                  Image.asset(
                    'assets/clarity_info-standard-line.png',
                    fit: BoxFit.fill,
                  )),
              customListTile(
                  'Privacy Policy',
                  Image.asset(
                    'assets/Group 34140.png',
                    fit: BoxFit.fill,
                  )),
              customListTile(
                  'Contact us',
                  Image.asset(
                    'assets/iconoir_headset-help.png',
                    fit: BoxFit.fill,
                  )),
              customListTile(
                  'Settings',
                  Icon(
                    Icons.settings,
                    color: AppColors.offWhite,
                    size: 30,
                  )),
              const Spacer(flex: 1),
              customListTile(
                  'Logout',
                  Icon(
                    Icons.logout,
                    size: 30,
                    color: AppColors.offWhite,
                  )),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  ListTile customListTile(String title, Widget icon) {
    return ListTile(
      onTap: () {},
      leading: icon,
      title: Text(title),
    );
  }
}
