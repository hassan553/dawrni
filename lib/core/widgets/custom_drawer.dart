import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/responsive_text.dart';
import 'package:dawrni/features/auth/presentation/routes/login_route.dart';
import 'package:dawrni/features/home/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:dawrni/features/home/presentation/routes/main_route.dart';
import 'package:dawrni/features/settings/presentation/routes/about_us_route.dart';
import 'package:dawrni/features/settings/presentation/routes/contact_us_route.dart';
import 'package:dawrni/features/settings/presentation/routes/privacy_policy_route.dart';
import 'package:dawrni/features/settings/presentation/routes/setting_route.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                () => context.go(MainRoute.name)),
            customListTile(
                'About us',
                Image.asset(
                  'assets/clarity_info-standard-line.png',
                  fit: BoxFit.fill,
                ),
                () => context.push(AboutUsRoute.name)),
            customListTile(
                'Privacy Policy',
                Image.asset(
                  'assets/Group 34140.png',
                  fit: BoxFit.fill,
                ),
               () => context.push(PrivacyPolicyRoute.name)),
            customListTile(
                'Contact us',
                Image.asset(
                  'assets/iconoir_headset-help.png',
                  fit: BoxFit.fill,
                ),
             () => context.push(ContactUsRoute.name)),
            customListTile(
                'Settings',
                Icon(
                  Icons.settings,
                  color: AppColors.offWhite,
                  size: 30,
                ),
               () => context.push(SettingsRoute.name)),
            const Spacer(flex: 1),
            customListTile(
                S.of(context).logout,
                Icon(
                  Icons.logout,
                  size: 30,
                  color: AppColors.offWhite,
                ),
                () {
                  context.read<AppConfigBloc>().add(const LogOutEvent());
                  context.go(LoginRoute.name);
                }),
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
