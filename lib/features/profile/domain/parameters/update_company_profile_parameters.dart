import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UpdateCompanyProfileParameters extends Equatable {
  final String? nameEn;
  final String? nameAr;
  final String? addressEn;
  final String? addressAr;
  final String? aboutEn;
  final String? aboutAr;
  final int? categoryId;
  final double? lat;
  final double? lng;
  final File? image;

  const UpdateCompanyProfileParameters(
      {
        this.nameEn,
        this.nameAr,
        this.addressEn,
        this.addressAr,
        this.aboutEn,
        this.aboutAr,
        this.categoryId,
        this.lat,
        this.lng,
        this.image
      });

  Future<Map<String, dynamic>> toJson() async => {
  if(nameEn != null)
    "name_en": nameEn,
  if(nameAr != null)
    "name_ar": nameAr,
  if(addressEn != null)
    "address_en": addressEn,
  if(addressAr != null)
    "address_ar": addressAr,
  if(aboutEn != null)
    "about_en": aboutEn,
  if(aboutAr != null)
    "about_ar": aboutAr,
  if(categoryId != null)
    "category_id": categoryId,
  if(lat != null)
    "lat": lat,
  if(lng != null)
    "lng": lng,
  if(image != null)
    "image" : await MultipartFile.fromFile(image!.path, filename: 'image')
  };

  @override
  List<Object?> get props => [nameEn, nameAr, addressEn, addressAr, aboutEn, aboutAr, categoryId, lat, lng, image];
}