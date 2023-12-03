import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/core/translations/app_local.dart';


class CategoryEntity extends BaseEntity {
  final int id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String image;

  String get name => (AppLocale().isEnglish() ? nameEn : nameAr) ?? '';

  String get description => (AppLocale().isEnglish() ? descriptionEn : descriptionAr) ?? '';

  CategoryEntity({required this.id, required this.nameEn, required this.nameAr, required this.descriptionEn, required this.descriptionAr, required this.image});

  @override
  List<Object?> get props => [name, description, image];

}