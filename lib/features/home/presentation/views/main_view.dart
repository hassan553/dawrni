import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/widgets/custom_drawer.dart';
import 'package:dawrni/features/appointments/presentation/views/appointments_view.dart';
import 'package:dawrni/features/chats/presentation/views/chats_view.dart';
import 'package:dawrni/features/favourites/presentation/views/favourites_view.dart';
import 'package:dawrni/features/home/presentation/views/home_view.dart';
import 'package:dawrni/features/notifications/presentation/routes/notifications_route.dart';
import 'package:dawrni/features/profile/presentation/views/client_profile_view.dart';
import 'package:dawrni/features/profile/presentation/views/company_profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  List screens = [
    const HomeView(),
    const AppointmentsView(),
    const FavouriteView(),
    const ChatHomeScreen(),
    if (CacheStorageServices().isCompany) const CompanyProfileView() else const ClientProfileView(),
  ];

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return drawerWidget();
  }

  AdvancedDrawer drawerWidget() {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: AppColors.secondColor),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: false,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const CustomDrawer(),
      child: Scaffold(
        appBar: customAppBar(_advancedDrawerController),
        body: screens[_currentIndex],
        bottomNavigationBar: customBottomNavBar(),
      ),
    );
  }

  BottomNavigationBar customBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.offWhite,
      backgroundColor: AppColors.secondColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => setState(() {
        _currentIndex = index;
      }),
      iconSize: 20,
      selectedIconTheme: const IconThemeData(size: 25),
      items: [
        BottomNavigationBarItem(
          icon: _currentIndex == 0
              ? Image.asset(
                  'assets/Group 341242.png',
                  height: 20,
                  fit: BoxFit.fitHeight,
                )
              : Image.asset(
                  'assets/Group 34124.png',
                  height: 20,
                  fit: BoxFit.fitHeight,
                ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 1
              ? Image.asset(
                  'assets/Group 34212.png',
                  height: 20,
                  fit: BoxFit.fitHeight,
                )
              : Image.asset(
                  'assets/Group 34119.png',
                  height: 20,
                  fit: BoxFit.fitHeight,
                ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              _currentIndex == 2 ? Icons.bookmark : CupertinoIcons.bookmark),
          label: 'Search',
        ),
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_text),
          label: 'chat',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
          ),
          label: 'Profile',
        ),
      ],
    );
  }

  void _handleMenuButtonPressed(advancedDrawerController) {
    advancedDrawerController.showDrawer();
  }

  AppBar customAppBar(advancedDrawerController) {
    return AppBar(
      leading: null,
      automaticallyImplyLeading: false,
      backgroundColor: _currentIndex == 4
          ? AppColors.primaryColor
          : Theme.of(context).scaffoldBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsetsDirectional.only(start: 5),
            decoration: BoxDecoration(
                color: _currentIndex == 4
                    ? Colors.white.withOpacity(0.4000000059604645)
                    : AppColors.secondColor,
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsetsDirectional.all(1),
            child: IconButton(
              onPressed: () =>
                  _handleMenuButtonPressed(advancedDrawerController),
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: value.visible
                        ? Icon(
                            Icons.clear,
                            key: ValueKey<bool>(value.visible),
                            size: 25,
                          )
                        : Image.asset('assets/Category.png'),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () => context.push(NotificationsRoute.name),
            
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsetsDirectional.only(start: 5),
              decoration: BoxDecoration(
                  color: _currentIndex == 4
                      ? Colors.white.withOpacity(0.4000000059604645)
                      : AppColors.secondColor,
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsetsDirectional.all(1),
              child: const Icon(
                Icons.notifications,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
