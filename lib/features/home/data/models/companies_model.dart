import 'package:dawrni/core/constants/app_constants.dart';
import 'package:dawrni/core/core_models/models/company_photo_model.dart';
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
    this.categoryId,
    this.name,
    this.address,
    this.about,
    this.isCertified,
    this.user,
  });

  CompanyModel.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category'];
    name = json['name'];
    address = json['address'];
    about = json['about'];
    image = json['image'];
    isCertified = json['is_certified'];
    user = json['user'];
    photos = (json['photos'] as List).map((e) => CompanyPhotoModel.fromJson(e)).toList();
  }

  int? id;
  int? categoryId;
  String? name;
  String? address;
  String? about;
  String? image;
  bool? isCertified;
  String? user;
  bool? isFavorite;
  List<CompanyPhotoModel>? photos;

  @override
  CompanyEntity toEntity() {
    return CompanyEntity(
      id: id!,
      category: AppConstants.categories.firstWhere((element) => element.id == categoryId!, orElse: () => AppConstants.categories.first),
      name: name ?? '',
      about: about ?? '',
      image: image ?? '',
      address: address ?? '' ,
      isCertified: isCertified ?? false,
      isFavorite: isFavorite ?? false,
      photos: photos?.map((e) => e.toEntity()).toList() ?? []
    );
  }
}
