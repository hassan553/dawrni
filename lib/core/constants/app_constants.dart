import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';
import 'package:dawrni/generated/l10n.dart';

class AppConstants{
  static List<CategoryEntity> categories = [
    CategoryEntity(id: 1, name: S.current.category1Name, description: S.current.category1Description, image: ImagesPaths.category1Png),
    CategoryEntity(id: 2, name: S.current.category2Name, description: S.current.category2Description, image: ImagesPaths.category2Png),
    CategoryEntity(id: 3, name: S.current.category3Name, description: S.current.category3Description, image: ImagesPaths.category3Png),
    CategoryEntity(id: 4, name: S.current.category4Name, description: S.current.category4Description, image: ImagesPaths.category4Png),
    CategoryEntity(id: 5, name: S.current.category5Name, description: S.current.category5Description, image: ImagesPaths.category5Png),
    CategoryEntity(id: 6, name: S.current.category6Name, description: S.current.category6Description, image: ImagesPaths.category6Png),
    CategoryEntity(id: 7, name: S.current.category7Name, description: S.current.category7Description, image: ImagesPaths.category7Png),
    CategoryEntity(id: 8, name: S.current.category8Name, description: S.current.category8Description, image: ImagesPaths.category8Png),
    CategoryEntity(id: 9, name: S.current.category9Name, description: S.current.category9Description, image: ImagesPaths.category9Png),
    CategoryEntity(id: 10, name: S.current.category10Name, description: S.current.category10Description, image: ImagesPaths.category10Png),
  ];
}