import 'package:dawrni/core/constants/app_constants.dart';
import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/profile/domain/entities/company_photo_entity.dart';
import 'package:dawrni/features/profile/domain/entities/company_profile_entity.dart';

class CompanyProfileModel extends BaseModel<CompanyProfileEntity> {
  final String? nameEn;
  final String? nameAr;
  final String? addressEn;
  final String? addressAr;
  final String? aboutEn;
  final String? aboutAr;
  final int? categoryId;
  final double? lat;
  final double? lng;
  final String? imageUrl;
  final List<String>? photos;
  CompanyProfileModel(
      {
        this.nameEn,
        this.nameAr,
        this.addressEn,
        this.addressAr,
        this.aboutEn,
        this.aboutAr,
        this.categoryId,
        this.lat,
        this.lng,
        this.imageUrl,
        this.photos
      });

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    return CompanyProfileModel(
        nameEn: json['name_en'],
        nameAr: json['name_ar'],
      addressEn: json['address_en'],
      addressAr: json['address_ar'],
      aboutEn: json['about_en'],
      aboutAr: json['about_ar'],
      categoryId: json['category'],
      lat: json['lat'],
      lng: json['lng'],
      imageUrl: json['image'],
      photos: json['photos'],
    );
  }

  @override
  CompanyProfileEntity toEntity() {
    return CompanyProfileEntity(
      nameEn: nameEn,
      nameAr: nameAr,
      category: categoryId == null ? null : AppConstants.categories.firstWhere((element) => element.id == categoryId!),
      addressEn: addressEn,
      addressAr: addressAr,
      aboutEn: aboutEn,
      aboutAr: aboutAr,
      imageUrl: imageUrl,
      lat: lat,
      lng: lng,
      photos: photos?.map((e) => CompanyPhotoEntity(id: 1, imageUrl: e)).toList()
    );
  }
}
