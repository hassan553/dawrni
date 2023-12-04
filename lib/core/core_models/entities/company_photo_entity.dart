import 'package:dawrni/core/entities/base_entity.dart';

class CompanyPhotoEntity extends BaseEntity {
  final int id;
  final String imageUrl;

  CompanyPhotoEntity({
    required this.id,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, imageUrl];
}