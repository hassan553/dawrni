import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';
import 'package:dawrni/features/home/presentation/blocs/edit_favorites_bloc/edit_favorites_bloc.dart';
import 'package:dawrni/features/home/presentation/routes/company_details_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompanyCard extends StatelessWidget {
  final CompanyEntity company;
  const CompanyCard({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16)
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPrimary: AppColors.lightGrey,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          context.push(CompanyDetailsRoute.name, extra: company);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
                height: 120,
                child: AppNetworkImage(url: company.image)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(company.name, style: context.f15700),
                  const SizedBox(height: 10),
                  Text(company.category.name, style: context.f14400),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: IconButton(
                onPressed: () {
                  EditFavoritesEvent event = company.isFavorite ? DeleteFromFavoritesEvent(id: company.id) : AddToFavoritesEvent(id: company.id);
                  context.read<EditFavoritesBloc>().add(event);
                },
                  icon: Icon(Icons.bookmark_border, color: AppColors.primaryColor.withOpacity(0.6), size: 30)),
            ),

          ],
        ),
      ),
    );
  }
}
