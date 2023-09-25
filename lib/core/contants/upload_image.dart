import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class PickImageAndUpload {
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImage() async {
    File? image;

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      return image;
    } else {
      return null;
    }
  }

  Future<String?> uploadImage(File? image) async {
    if (image != null) {
      try {
        String? downloadUrl;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final Reference storageReference =
            storage.ref().child('images/${basename(image.path)}');
        final UploadTask uploadTask = storageReference.putFile(image);

        await uploadTask.whenComplete(() async {
          downloadUrl = await storageReference.getDownloadURL();
        });
        return downloadUrl;
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }
}
