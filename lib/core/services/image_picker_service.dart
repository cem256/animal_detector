import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<File?> selectFromGallery();
  Future<File?> takePhoto();
}

class ImagePickerServiceImp implements ImagePickerService {
  final ImagePicker imagePicker;

  ImagePickerServiceImp({required this.imagePicker});

  @override
  Future<File?> selectFromGallery() async {
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  @override
  Future<File?> takePhoto() async {
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
