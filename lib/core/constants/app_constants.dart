import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';
import 'package:dawrni/generated/l10n.dart';

class AppConstants{
  static List<CategoryEntity> categories = [
    CategoryEntity(id: 1, nameEn: S.current.category1Name, nameAr: '', descriptionEn: S.current.category1Description, descriptionAr: '', image: ImagesPaths.category1Png),
    CategoryEntity(id: 2, nameEn: S.current.category2Name, nameAr: '', descriptionEn: S.current.category2Description, descriptionAr: '', image: ImagesPaths.category2Png),
    CategoryEntity(id: 3, nameEn: S.current.category3Name, nameAr: '', descriptionEn: S.current.category3Description, descriptionAr: '', image: ImagesPaths.category3Png),
    CategoryEntity(id: 4, nameEn: S.current.category4Name, nameAr: '', descriptionEn: S.current.category4Description, descriptionAr: '', image: ImagesPaths.category4Png),
    CategoryEntity(id: 5, nameEn: S.current.category5Name, nameAr: '', descriptionEn: S.current.category5Description, descriptionAr: '', image: ImagesPaths.category5Png),
    CategoryEntity(id: 6, nameEn: S.current.category6Name, nameAr: '', descriptionEn: S.current.category6Description, descriptionAr: '', image: ImagesPaths.category6Png),
    CategoryEntity(id: 7, nameEn: S.current.category7Name, nameAr: '', descriptionEn: S.current.category7Description, descriptionAr: '', image: ImagesPaths.category7Png),
    CategoryEntity(id: 8, nameEn: S.current.category8Name, nameAr: '', descriptionEn: S.current.category8Description, descriptionAr: '', image: ImagesPaths.category8Png),
    CategoryEntity(id: 9, nameEn: S.current.category9Name, nameAr: '', descriptionEn: S.current.category9Description, descriptionAr: '', image: ImagesPaths.category9Png),
    CategoryEntity(id: 10, nameEn: S.current.category10Name, nameAr: '', descriptionEn: S.current.category10Description, descriptionAr: '', image: ImagesPaths.category10Png),
  ];
}