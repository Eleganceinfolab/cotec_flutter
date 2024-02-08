import 'dart:io';

import 'package:cotec/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ActiveTestDetailScreenController extends GetxController {
  RxString image = ''.obs;
  Future<void> pickImages(ImageSource source) async {
    var result = await CommonConstant.instance.requestFilePermission();
    if (result) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        image.value = File(pickedFile.name)
            .toString()
            .replaceAll('File:', '')
            .replaceAll('\'', '')
            .replaceAll('null', '');
        Get.back();
      } else {
        print('No image selected.');
      }
    } else {
      openAppSettings();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
