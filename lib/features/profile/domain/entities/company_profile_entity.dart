import 'package:dawrni/core/core_models/entities/company_photo_entity.dart';
import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/core/translations/app_local.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';

class CompanyProfileEntity extends BaseEntity {
  final String? nameEn;
  final String? nameAr;
  final String? addressEn;
  final String? addressAr;
  final String? aboutEn;
  final String? aboutAr;
  final CategoryEntity? category;
  final double? lat;
  final double? lng;
  final String? imageUrl;
  final bool isCertified;
  final List<CompanyPhotoEntity>? photos;

  String get name => (AppLocale().isEnglish() ? nameEn : nameAr) ?? '';

  String get address => (AppLocale().isEnglish() ? addressEn : addressAr) ?? '';

  String get about => (AppLocale().isEnglish() ? aboutEn : aboutAr) ?? '';

  CompanyProfileEntity(
      {
        this.nameEn,
        this.nameAr,
        this.addressEn,
        this.addressAr,
        this.aboutEn,
        this.aboutAr,
        this.category,
        this.lat,
        this.lng,
        this.imageUrl,
        this.isCertified = false,
        this.photos
      });
  @override
  List<Object?> get props =>
      [nameEn, nameAr, addressEn, addressAr, aboutEn, aboutAr, category, lat, lng, imageUrl, photos];
}
