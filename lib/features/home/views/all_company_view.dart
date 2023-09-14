import 'package:dawrni/core/widgets/customAppBar.dart';
import 'package:dawrni/core/widgets/custom_drawer.dart';
import 'package:dawrni/core/widgets/drawer_widget.dart';
import 'package:dawrni/features/home/widget/company_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class AllCompanyView extends StatefulWidget {
  const AllCompanyView({super.key});

  @override
  State<AllCompanyView> createState() => _AllCompanyViewState();
}

class _AllCompanyViewState extends State<AllCompanyView> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _advancedDrawerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return drawerWidget(Scaffold(
      appBar: customAppBar(_advancedDrawerController),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 30, end: 15, start: 15),
        child: ListView.separated(
          itemBuilder: (context, index) => const CompanyWidget(),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: 100,
        ),
      ),
    ));
  }
}
