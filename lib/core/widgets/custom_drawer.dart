import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///TODO: change navigations here
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Row(
            //   children: [
            //     Icon(Icons.add),
            //     Spacer(),
            //     Icon(Icons.add),
            //   ],
            // ),
            const Spacer(flex: 1),
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
                color: Colors.white,
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
                ),
                // () => context.push(const MainView())),
                    () => context.push("/mainview")),
            customListTile(
                'About us',
                Image.asset(
                  'assets/clarity_info-standard-line.png',
                  fit: BoxFit.fill,
                ),
                // () => context.push(const AboutUsView())),
                    () => context.push("/aboutus")),
            customListTile(
                'Privacy Policy',
                Image.asset(
                  'assets/Group 34140.png',
                  fit: BoxFit.fill,
                ),
                // () => context.push(const PrivacyPolicyView())),
                    () => context.push("/privacypolicyview")),
            customListTile(
                'Contact us',
                Image.asset(
                  'assets/iconoir_headset-help.png',
                  fit: BoxFit.fill,
                ),
                // () => context.push(const ConnectUsView())),
                    () => context.push("/connectus")),
            customListTile(
                'Settings',
                Icon(
                  Icons.settings,
                  color: AppColors.offWhite,
                  size: 30,
                ),
                // () => context.push(const SettingsView())),
                () => context.push("/settings")),
            const Spacer(flex: 1),
            customListTile(
                'Logout',
                Icon(
                  Icons.logout,
                  size: 30,
                  color: AppColors.offWhite,
                ),
                () {}),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  ListTile customListTile(String title, Widget icon, Function function) {
    return ListTile(
      onTap: () {
        
        function();
      },
      leading: icon,
      title: Text(title),
    );
  }
}
