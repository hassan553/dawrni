import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/features/home/domain/entities/category_entity.dart';
import 'package:dawrni/generated/l10n.dart';

class AppConstants{
  static List<CategoryEntity> categories = [
    CategoryEntity(id: 1, nameEn: S.current.category1Name, nameAr: S.current.category1Name, descriptionEn: S.current.category1Description, descriptionAr: S.current.category1Description, image: ImagesPaths.category1Png),
    CategoryEntity(id: 2, nameEn: S.current.category2Name, nameAr: S.current.category2Name, descriptionEn: S.current.category2Description, descriptionAr: S.current.category2Description, image: ImagesPaths.category2Png),
    CategoryEntity(id: 3, nameEn: S.current.category3Name, nameAr: S.current.category3Name, descriptionEn: S.current.category3Description, descriptionAr: S.current.category3Description, image: ImagesPaths.category3Png),
    CategoryEntity(id: 4, nameEn: S.current.category4Name, nameAr: S.current.category4Name, descriptionEn: S.current.category4Description, descriptionAr: S.current.category4Description, image: ImagesPaths.category4Png),
    CategoryEntity(id: 5, nameEn: S.current.category5Name, nameAr: S.current.category5Name, descriptionEn: S.current.category5Description, descriptionAr: S.current.category5Description, image: ImagesPaths.category5Png),
    CategoryEntity(id: 6, nameEn: S.current.category6Name, nameAr: S.current.category6Name, descriptionEn: S.current.category6Description, descriptionAr: S.current.category6Description, image: ImagesPaths.category6Png),
    CategoryEntity(id: 7, nameEn: S.current.category7Name, nameAr: S.current.category7Name, descriptionEn: S.current.category7Description, descriptionAr: S.current.category7Description, image: ImagesPaths.category7Png),
    CategoryEntity(id: 8, nameEn: S.current.category8Name, nameAr: S.current.category8Name, descriptionEn: S.current.category8Description, descriptionAr: S.current.category8Description, image: ImagesPaths.category8Png),
    CategoryEntity(id: 9, nameEn: S.current.category9Name, nameAr: S.current.category9Name, descriptionEn: S.current.category9Description, descriptionAr: S.current.category9Description, image: ImagesPaths.category9Png),
    CategoryEntity(id: 10, nameEn: S.current.category10Name, nameAr: S.current.category10Name, descriptionEn: S.current.category10Description, descriptionAr: S.current.category10Description, image: ImagesPaths.category10Png),
  ];
  static const String appointmentPendingStatus = 'pending';
}