import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<File?> selectFromGallery();
  Future<XFile?> takePhoto();
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
  Future<XFile?> takePhoto() async {
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    return image;
  }
}
