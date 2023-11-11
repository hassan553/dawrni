import 'package:dawrni/core/entities/base_entity.dart';

abstract class BaseModel<T extends BaseEntity>{
  T toEntity();
}