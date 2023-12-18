import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/profile/domain/entities/client_profile_entity.dart';

class ClientProfileModel extends BaseModel<ClientProfileEntity> {
  final String? nameEn;
  final String? nameAr;
  final String? imageUrl;

  ClientProfileModel({
    this.nameEn,
    this.nameAr,
    this.imageUrl,
  });

  factory ClientProfileModel.fromJson(Map<String, dynamic> json) {
    return ClientProfileModel(
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      imageUrl: json['photo'],
    );
  }

  @override
  ClientProfileEntity toEntity() {
    return ClientProfileEntity(
      nameEn: nameEn,
      nameAr: nameAr,
      imageUrl: imageUrl,
    );
  }
}
