import 'package:dawrni/core/core_models/entities/company_photo_entity.dart';
import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/core/translations/app_local.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';

class ClientProfileEntity extends BaseEntity {
  final String? nameEn;
  final String? nameAr;
  final String? imageUrl;

  String get name => (AppLocale().isEnglish() ? nameEn : nameAr) ?? '';


  ClientProfileEntity(
      {
        this.nameEn,
        this.nameAr,
        this.imageUrl,
      });
  @override
  List<Object?> get props =>
      [nameEn, nameAr, imageUrl];
}
