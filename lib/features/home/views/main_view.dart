import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dawrni/core/widgets/customAppBar.dart';
import 'package:dawrni/features/appointments/view/appointments_view.dart';
import 'package:dawrni/features/favourites/view/favourites_view.dart';
import 'package:dawrni/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_drawer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _index = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List screens = const [
    AppointmentsView(),
    FavouriteView(),
    HomeView(),
    HomeView(),
    HomeView()
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
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const CustomDrawer(),
      child: Scaffold(
        appBar: customAppBar(_advancedDrawerController),
        body: screens[_index],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 2,
              height: 60.0,
              items: [
                Image.asset('assets/Group 34119.png',
                    width: 16, fit: BoxFit.fill),
                Image.asset('assets/Bookmark_light.png',
                    width: 16, fit: BoxFit.fill),
                Image.asset('assets/Group 34124.png',
                    width: 16, fit: BoxFit.fill),
                Image.asset('assets/Chat_light.png',
                    width: 20, fit: BoxFit.fill),
                Image.asset('assets/Group 34120.png',
                    width: 16, fit: BoxFit.fill),
              ],
              color: AppColors.secondColor,
              buttonBackgroundColor: AppColors.primaryColor,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  _index = index;
                });
              },
              letIndexChange: (index) => true,
            ),
          ),
        ),
      ),
    );
  }

void _handleMenuButtonPressed(advancedDrawerController) {
  advancedDrawerController.showDrawer();
  
}

AppBar customAppBar(advancedDrawerController) {
  return AppBar(
    leading: null,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsetsDirectional.only(start: 5),
          decoration: BoxDecoration(
              color: AppColors.secondColor,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsetsDirectional.all(1),
          child: IconButton(
            onPressed: () => _handleMenuButtonPressed(advancedDrawerController),
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
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsetsDirectional.only(start: 5),
          decoration: BoxDecoration(
              color: AppColors.secondColor,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsetsDirectional.all(1),
          child: const Icon(
            Icons.notifications,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

  AnimatedBottomNavigationBar customBottomBar() {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.content_paste,
        Icons.bookmark,
        Icons.chat,
        Icons.person,
      ],
      activeIndex: _index,
      activeColor: AppColors.primaryColor,
      inactiveColor: AppColors.offWhite,
      backgroundColor: AppColors.secondColor,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() {
        _index = index;
      }),
      //other params
    );
  }
}
