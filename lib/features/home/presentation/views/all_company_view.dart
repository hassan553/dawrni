import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/features/home/presentation/widgets/company_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:go_router/go_router.dart';

class AllCompanyView extends StatefulWidget {
  const AllCompanyView({super.key});

  @override
  State<AllCompanyView> createState() => _AllCompanyViewState();
}

class _AllCompanyViewState extends State<AllCompanyView> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  void dispose() {
    _advancedDrawerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(27),
        child: ListView.separated(
          itemBuilder: (context, index) => const CompanyWidget(),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: 100,
        ),
      ),
    );
  }

  AppBar settingAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () => context.pop(),
        
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
