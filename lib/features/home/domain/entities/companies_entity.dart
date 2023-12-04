import 'package:dawrni/core/core_models/entities/company_photo_entity.dart';
import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';

class CompaniesEntity extends BaseEntity {
  final List<CompanyEntity> companies;

  CompaniesEntity({required this.companies});

  @override
  List<Object?> get props => [companies];

}

class CompanyEntity extends BaseEntity {
  CompanyEntity({
    required this.id,
    required this.category,
    required this.name,
    required this.about,
    required this.image,
    required this.address,
    required this.isCertified,
    required this.isFavorite,
    required this.photos
  });

  final int id;
  final CategoryEntity category;
  final String name;
  final String address;
  final String about;
  final String image;
  final bool isCertified;
  final bool isFavorite;
  final List<CompanyPhotoEntity> photos;

  @override
  List<Object?> get props => [id, category, name, address, about, image, isCertified, isFavorite, photos];
}