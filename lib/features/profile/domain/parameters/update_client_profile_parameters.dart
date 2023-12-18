import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class UpdateClientProfileParameters extends Equatable {
  final String? nameEn;
  final String? nameAr;
  final XFile? image;

  const UpdateClientProfileParameters(
      {
        this.nameEn,
        this.nameAr,
        this.image
      });

  Future<Map<String, dynamic>> toJson() async => {
  if(nameEn != null)
    "name_en": nameEn,
  if(nameAr != null)
    "name_ar": nameAr,
  if(image != null)
    "photo" : await MultipartFile.fromFile(image!.path, filename: image!.name)
  };

  @override
  List<Object?> get props => [nameEn, nameAr, image];
}