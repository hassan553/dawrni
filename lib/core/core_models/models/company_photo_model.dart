import 'package:dawrni/core/core_models/entities/company_photo_entity.dart';
import 'package:dawrni/core/models/base_model.dart';

class CompanyPhotoModel extends BaseModel<CompanyPhotoEntity> {
  CompanyPhotoModel({
    this.id,
    this.image,
  });

  CompanyPhotoModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }

  int? id;
  String? image;

  @override
  CompanyPhotoEntity toEntity() {
    return CompanyPhotoEntity(id: id!, imageUrl: image  ?? '');
  }

}