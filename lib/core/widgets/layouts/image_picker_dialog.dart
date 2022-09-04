import 'dart:io';
import 'package:contact_app/core/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog {
  Future<File?> show() async {
    return Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async =>
                getImage(source: ImageSource.gallery).then((value) {
              Get.back(result: value);
            }),
            child: const Text(AppStrings.gallery),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async =>
                getImage(source: ImageSource.camera).then((value) {
              Get.back(result: value);
            }),
            child: const Text(AppStrings.gallery),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Future<File?> getImage({required ImageSource source}) async {
    //Clicking or Picking from Gallery

    var image = await ImagePicker().pickImage(source: source);

    //Cropping the image

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      maxWidth: 1024,
      maxHeight: 1920,
    );
    File file = File(croppedFile!.path);
    return file;
  }
}
