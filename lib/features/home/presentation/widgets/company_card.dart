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
          context.push(CompanyDetailsRoute.name, extra: company.id.toString());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 120,
                height: 120,
                child: AppNetworkImage(url: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAYFBMVEX///90z+Cs4uy96fCX2eZeyNuO2eYAs84AttAAt9EAss5Vydz8//8AudI7wtj0/P3r+fug3urb8/c9w9jO7vQnvtW66PDU8PWC1eTl9/puz+AArsxy0OHw+/zP7/VLxdqiOX/MAAADMElEQVR4nO3d0W6jOBSA4RNoYmMwkFAngWnL+7/lHifTGalbrVYjH9Lt/t9NEuK2/rEhVW8qAgAAAAAAAAAAAAAAAAD/Ste9P/l44E+GfT2vqwv9See7xKZ/1gPzGpv98HFYt/cu5bevsbk9jm0T23Hz6f6B5HaLjyKti70PowzRp+TSx2GTW3bed7LkYe4iXR7m439gGZ9/LCK9G2fXixzDVY7uqrkhL9Nzvxc59/pa5h9rPgmXIaROzmGRs9Ove3Hn/D1e+vnQr/q0nU7SrdPrY5M+mI+nvI5D5Y4ig2bunR44u6f85qIP3ucdOx7fRFY3P+d+cVGuTs/B/ZW0vvfJ6dhLSHINx0f2fK52qy5dpRdbkzRj/DX1LjZtOL8Pu+jePecTIbHR5dMTcXL7/Ebr9aHOW/0QWj89qOIfzF6j7oUx6Rr+LpSL98v7sNeoUffF1cKdXou/CnOtbvVZl9nHr3f3OcW84W5TH3Uxlzz1256VvDD++nPYHPNq3tPzZnT17136szDv9+br3Xwql/JZH1161WvoSV8v0k0hz1mGJvU5X3JryocGH2d50rA6rJ3ekOr8XpsX+s17/ShxrW8flvK5yjXTNKVaLyzfuHxXSa7xupbZS6jG0OQ7TR2aXodVcnA+Oj/njw8d39+GtU2Kqw8HOenitqF6YM4nqj7TQjmuadGZy3Dt0+G21d6i3jWqmK/EOvWTDtPJV23a59XsDlO63ndkG057n3RfT/EiQ4rz43KM3K/D7+x/UBi+e2F1/XqfgQCwoaHe1t/+OmKuivstxe1/Z612m/64HYXlUVgYhQYoLIxCAxQWRqEBCguj0ACFhVFogMLCKDRAYWEUGqCwMAoNUFgYhQYoLIxCAxQWRqEBCguj0ACFhVFogMLCKDRAYWEUGqCwMAoNUFgYhQYoLIxCAxQWRqEBCguj0ACFhVFogMLCKDRAYWEUGqCwMAoNUFgYhQYoLIxCAxQWRqEBCguj0ACFhVFogMLCKDRAYWEUGqCwMAoNUFgYhQYoLIxCAxQWRqEBCgt7RGE6bCltXzg/bev7/TsvAAAAAAAAAAAAAAAAAAAAAPjUX0IuJ7I/RXj4AAAAAElFTkSuQmCC')),
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
