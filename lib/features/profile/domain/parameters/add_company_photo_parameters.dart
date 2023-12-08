import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class AddCompanyPhotoParameters extends Equatable {
  final XFile image;

  const AddCompanyPhotoParameters({
    required this.image,
  });

  Future<Map<String, dynamic>> toJson() async =>
      {"image": await MultipartFile.fromFile(image.path, filename: image.name)};

  @override
  List<Object?> get props => [image];
}
