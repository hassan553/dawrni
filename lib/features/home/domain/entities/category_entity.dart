import 'package:dawrni/core/entities/base_entity.dart';


class CategoryEntity extends BaseEntity {
  final int id;
  final String name;
  final String description;
  final String image;

  CategoryEntity({required this.id, required this.name, required this.description, required this.image});

  @override
  List<Object?> get props => [name, description, image];

}