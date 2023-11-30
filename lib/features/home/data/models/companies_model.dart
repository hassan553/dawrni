import 'package:dawrni/core/constants/app_constants.dart';
import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/home/domain/entities/companies_entity.dart';


class CompaniesModel extends BaseModel<CompaniesEntity> {
  List<CompanyModel>? companies;
  
  CompaniesModel({
    this.companies,
});


  CompaniesModel.fromJson(dynamic json) {
    companies = (json['results'] as List).map((e) => CompanyModel.fromJson(e)).toList();
  }
  
  @override
  CompaniesEntity toEntity() {
    return CompaniesEntity(companies: companies?.map((e) => e.toEntity()).toList() ?? []);
  }
  
}

class CompanyModel extends BaseModel<CompanyEntity> {
  CompanyModel({
    this.id,
    this.category,
    this.nameAr,
    this.nameEn,
    this.addressAr,
    this.addressEn,
    this.aboutAr,
    this.aboutEn,
    this.isCertified,
    this.user,
  });

  CompanyModel.fromJson(dynamic json) {
    id = json['id'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    addressAr = json['address_ar'];
    addressEn = json['address_en'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    image = json['image'];
    isCertified = json['is_certified'];
    user = json['user'];
  }

  int? id;
  Category? category;
  String? nameAr;
  String? nameEn;
  String? addressAr;
  String? addressEn;
  String? aboutAr;
  String? aboutEn;
  String? image;
  bool? isCertified;
  int? user;
  bool? isFavorite;

  @override
  CompanyEntity toEntity() {
    return CompanyEntity(
      id: id!,
      category: AppConstants.categories.firstWhere((element) => element.id == category!.id!, orElse: () => AppConstants.categories.first),
      name: nameEn ?? '',
      about: aboutEn ?? '',
      image: image ?? '',
      address: addressEn ?? '' ,
      isCertified: isCertified ?? false,
      isFavorite: isFavorite ?? false,
    );
  }
}

class Category {
  Category({
    this.id,
    this.name,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
