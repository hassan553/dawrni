import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dawrni/core/widgets/custom_drawer.dart';
import 'package:dawrni/features/appointments/presentation/blocs/change_company_appointment_status_bloc%20copy/change_company_appointment_status_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/client_appointments_bloc/client_appointments_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/company_appointments_bloc/company_appointments_bloc.dart';
import 'package:dawrni/features/appointments/presentation/blocs/delete_client_appointment_bloc/delete_client_appointment_bloc.dart';
import 'package:dawrni/features/appointments/presentation/views/client_appointments_view.dart';
import 'package:dawrni/features/appointments/presentation/views/company_appointments_view.dart';
import 'package:dawrni/features/chats/presentation/views/chats_view.dart';
import 'package:dawrni/features/home/presentation/views/favorites_view.dart';
import 'package:dawrni/features/home/presentation/views/home_view.dart';
import 'package:dawrni/features/notifications/presentation/routes/notifications_route.dart';
import 'package:dawrni/features/profile/presentation/blocs/client_profile_bloc/client_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/blocs/company_profile_bloc/company_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/blocs/update_profile_bloc/update_profile_bloc.dart';
import 'package:dawrni/features/profile/presentation/views/client_profile_view.dart';
import 'package:dawrni/features/profile/presentation/views/company_profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    if (CacheStorageServices().isCompany) ...{
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<CompanyAppointmentsBloc>()
              ..add(const FetchCompanyAppointmentsEvent(refresh: true)),
          ),
          BlocProvider(
            create: (context) => sl<ChangeCompanyAppointmentStatusBloc>(),
          ),
        ],
        child: const CompanyAppointmentsView(),
      ),
    } else ...{
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<ClientAppointmentsBloc>()
              ..add(const FetchClientAppointmentsEvent(refresh: true)),
          ),
          BlocProvider(
            create: (context) => sl<DeleteClientAppointmentBloc>(),
          ),
        ],
        child: const ClientAppointmentsView(),
      ),
    },
    const FavoritesView(),
    const ChatHomeScreen(),
    if (CacheStorageServices().isCompany)
      BlocProvider(
          create: (context) => sl<UpdateProfileBloc>(),
          child: const CompanyProfileView())
    else
      BlocProvider(
          create: (context) => sl<UpdateProfileBloc>(),
          child: const ClientProfileView()),
  ];

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    if (CacheStorageServices().isCompany) {
      context.read<CompanyProfileBloc>().add(const FetchCompanyProfileEvent());
    } else {
      context.read<ClientProfileBloc>().add(const FetchClientProfileEvent());
    }
    super.initState();
  }

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
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
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
