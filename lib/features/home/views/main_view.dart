import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dawrni/core/functions/global_function.dart';
import 'package:dawrni/core/widgets/customAppBar.dart';
import 'package:dawrni/features/appointments/view/appointments_view.dart';
import 'package:dawrni/features/favourites/view/favourites_view.dart';
import 'package:dawrni/features/home/views/home_view.dart';
import 'package:dawrni/features/notifications/view/notifications_view.dart';
import 'package:dawrni/features/profile/client/view/client_profile_view.dart';
import 'package:dawrni/features/profile/client/view/company_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../chats/view/chats_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 2;

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List screens = const [
    AppointmentsView(),
    FavouriteView(),
    HomeView(),
    ChatHomeScreen(),
    ClientProfileView(),
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
        extendBody: true,
        appBar: customAppBar(_advancedDrawerController),
        //body: screens[_currentIndex],
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(screens.length, (index) => screens[index]),
        ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => setState(() {
        //     _currentIndex = 2;
        //   }),
        //   child: const Icon(Icons.home),
        //   backgroundColor: AppColors.primaryColor,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        //   padding: const EdgeInsetsDirectional.only(bottom: 15),
        //   child: Container(
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        //     child: BottomAppBar(
        //         notchMargin: 8,
        //         shape: const CircularNotchedRectangle(),
        //         height: 30,
        //         color: Colors.red,
        //         child: Padding(
        //           padding: const EdgeInsetsDirectional.only(
        //               start: 10, end: 10, top: 12),
        //           child: Row(
        //             mainAxisSize: MainAxisSize.max,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               InkWell(
        //                 onTap: () => setState(() {
        //                   _currentIndex = 0;
        //                 }),
        //                 child: Image.asset('assets/Group 34119.png',
        //                     width: 16, fit: BoxFit.fill),
        //               ),
        //               const Spacer(flex: 1),
        //               InkWell(
        //                 onTap: () => setState(() {
        //                   _currentIndex = 1;
        //                 }),
        //                 child: Image.asset('assets/Bookmark_light.png',
        //                     width: 16, fit: BoxFit.fill),
        //               ),
        //               const Spacer(flex: 2),
        //               InkWell(
        //                 onTap: () => setState(() {
        //                   _currentIndex = 3;
        //                 }),
        //                 child: Image.asset('assets/Chat_light.png',
        //                     width: 20, fit: BoxFit.fill),
        //               ),
        //               const Spacer(flex: 1),
        //               InkWell(
        //                 onTap: () => setState(() {
        //                   _currentIndex = 4;
        //                 }),
        //                 child: Image.asset('assets/Group 34120.png',
        //                     width: 16, fit: BoxFit.fill),
        //               ),
        //             ],
        //           ),
        //         )
        // ),
        //   ),
        // ),
        bottomNavigationBar: AnimatedNotchBottomBar(
          color: AppColors.secondColor,
          showLabel: false,
          notchColor: AppColors.primaryColor,
          onTap: (value) => setState(() {
            _controller.index = value;
            _pageController.jumpToPage(value);
            _currentIndex = value;
          }),
          bottomBarItems: [
            BottomBarItem(
              inActiveItem: Image.asset('assets/Group 34119.png',
                  width: 16, fit: BoxFit.fitHeight),
              activeItem: Image.asset('assets/Group 34119.png',
                  width: 16, fit: BoxFit.fitHeight),
              itemLabel: 'Appointment',
            ),
            BottomBarItem(
              inActiveItem: Image.asset('assets/Bookmark_light.png',
                  width: 16, fit: BoxFit.fitHeight),
              activeItem: Image.asset('assets/Bookmark_light.png',
                  width: 16, fit: BoxFit.fitHeight),
              itemLabel: 'Favorite',
            ),
            BottomBarItem(
              inActiveItem: Image.asset('assets/Group 34124.png',
                  width: 16, fit: BoxFit.fitHeight),
              activeItem: Image.asset('assets/Group 34124.png',
                  width: 16, fit: BoxFit.fitHeight),
              itemLabel: 'home',
            ),
            BottomBarItem(
              inActiveItem: Image.asset('assets/Group 34120.png',
                  width: 16, fit: BoxFit.fitHeight),
              activeItem: Image.asset('assets/Group 34120.png',
                  width: 16, fit: BoxFit.fitHeight),
              itemLabel: 'people',
            ),
            BottomBarItem(
              inActiveItem: Image.asset('assets/Chat_light.png',
                  width: 20, fit: BoxFit.fill),
              activeItem: Image.asset('assets/Chat_light.png',
                  width: 20, fit: BoxFit.fill),
              itemLabel: 'chats',
            ),
          ],
          notchBottomBarController: _controller,
        ),
        /////////////////////////
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: AnimatedBottomNavigationBar(
        //   icons: [Icons.add, Icons.add, Icons.add, Icons.add],
        //   activeIndex: _currentIndex,
        //   gapLocation: GapLocation.center,
        //   notchSmoothness: NotchSmoothness.verySmoothEdge,
        //   leftCornerRadius: 32,
        //   rightCornerRadius: 32,
        //   height: 60,
        //   borderWidth: 200,

        //   onTap: (index) => setState(() => _currentIndex = index),
        //   //other params
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.add),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: Padding(
        //   child: AnimatedBottomNavigationBar(
        //     icons: const [
        //       Icons.add,
        //       Icons.add,
        //       Icons.add,
        //       Icons.add,
        //     ],
        //     activeIndex: _index,
        //     gapLocation: GapLocation.center,
        //     notchSmoothness: NotchSmoothness.verySmoothEdge,
        //     leftCornerRadius: 32,
        //     rightCornerRadius: 32,
        //     onTap: (index) => setState(() => _index = index),
        //     //other params
        //   ),
        // ),
        // bottomNavigationBar: Container(
        //   width: MediaQuery.of(context).size.width,
        //   padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        //   height: 80,
        //   child: Stack(
        //     children: [
        //       CustomPaint(
        //         size: Size(MediaQuery.of(context).size.width, 60),
        //         painter: BNBCustomPainter(),
        //       ),
        //       Center(
        //         heightFactor: 0.1,
        //         child: FloatingActionButton(
        //             backgroundColor: Colors.orange,
        //             child: Icon(Icons.shopping_basket),
        //             elevation: 0.1,
        //             onPressed: () {}),
        //       ),
        //       Container(
        //         width: MediaQuery.of(context).size.width,
        //         height: 60,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             IconButton(
        //               icon: Icon(
        //                 Icons.home,
        //                 color: _currentIndex == 0
        //                     ? Colors.orange
        //                     : Colors.grey.shade400,
        //               ),
        //               onPressed: () {
        //                 setBottomBarIndex(0);
        //               },
        //               splashColor: Colors.white,
        //             ),
        //             IconButton(
        //                 icon: Icon(
        //                   Icons.restaurant_menu,
        //                   color: _currentIndex == 1
        //                       ? Colors.orange
        //                       : Colors.grey.shade400,
        //                 ),
        //                 onPressed: () {
        //                   setBottomBarIndex(1);
        //                 }),
        //             Container(
        //               width: MediaQuery.of(context).size.width * 0.20,
        //             ),
        //             IconButton(
        //                 icon: Icon(
        //                   Icons.bookmark,
        //                   color: _currentIndex == 2
        //                       ? Colors.orange
        //                       : Colors.grey.shade400,
        //                 ),
        //                 onPressed: () {
        //                   setBottomBarIndex(2);
        //                 }),
        //             IconButton(
        //                 icon: Icon(
        //                   Icons.notifications,
        //                   color: _currentIndex == 3
        //                       ? Colors.orange
        //                       : Colors.grey.shade400,
        //                 ),
        //                 onPressed: () {
        //                   setBottomBarIndex(3);
        //                 }),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(20),
        //     child: CurvedNavigationBar(
        //       key: _bottomNavigationKey,
        //       index: 2,
        //       height: 60.0,
        //       items: [
        // Image.asset('assets/Group 34119.png',
        //     width: 16, fit: BoxFit.fill),
        // Image.asset('assets/Bookmark_light.png',
        //     width: 16, fit: BoxFit.fill),
        // Image.asset('assets/Group 34124.png',
        //     width: 16, fit: BoxFit.fill),
        // Image.asset('assets/Chat_light.png',
        //     width: 20, fit: BoxFit.fill),
        // Image.asset('assets/Group 34120.png',
        //     width: 16, fit: BoxFit.fill),
        //       ],
        //       color: AppColors.secondColor,
        //       buttonBackgroundColor: AppColors.primaryColor,
        //       backgroundColor: Colors.transparent,
        //       animationCurve: Curves.easeInOut,
        //       animationDuration: const Duration(milliseconds: 600),
        //       onTap: (index) {
        //         setState(() {
        //           _index = index;
        //         });
        //       },
        //       letIndexChange: (index) => true,
        //     ),
        //   ),
        // ),
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
            onTap: () => navigateTo(const NotificationsView()),
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

  AnimatedBottomNavigationBar customBottomBar() {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.content_paste,
        Icons.bookmark,
        Icons.chat,
        Icons.person,
      ],
      activeIndex: _currentIndex,
      activeColor: AppColors.primaryColor,
      inactiveColor: AppColors.offWhite,
      backgroundColor: AppColors.secondColor,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() {
        _currentIndex = index;
      }),
      //other params
    );
  }

  setBottomBarIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.1, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 0);
    path.arcToPoint(Offset(size.width * 0.60, 5),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.6, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, AppColors.secondColor, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
