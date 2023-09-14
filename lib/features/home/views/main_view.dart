import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dawrni/core/widgets/customAppBar.dart';
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
  int _index = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List screens = [
    HomeView(),
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
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 2,
              height: 55.0,
              items: const [
                Icon(
                  Icons.add,
                  size: 20,
                  color: AppColors.white,
                ),
                Icon(
                  Icons.list,
                  size: 20,
                  color: AppColors.white,
                ),
                Icon(
                  Icons.home,
                  size: 20,
                  color: AppColors.white,
                ),
                Icon(
                  Icons.compare_arrows,
                  size: 20,
                  color: AppColors.white,
                ),
                Icon(
                  Icons.call_split,
                  size: 20,
                  color: AppColors.white,
                ),
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
