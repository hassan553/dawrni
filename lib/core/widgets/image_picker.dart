import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImage {
  Future<File?> pickImage() async {
  File pickedImage;
    final imagePicker = ImagePicker();
    final _pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (_pickedImage != null) {
      pickedImage = File(_pickedImage.path);
      return pickedImage;
    }
    return null;
  }

  // final ImagePicker _picker = ImagePicker();
  // ImagePicker get picker => _picker;
  // XFile? pickedImage;
  // Future<void> pickImage(ImageSource source) async {
  //   try {
  //     XFile? image = await _picker.pickImage(source: source);
  //     if (image != null) {
  //       pickedImage = image;
  //     }
  //   } catch (e) {
  //     print("Error picking image: $e");
  //   }
  // }
}
