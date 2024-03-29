import 'dart:async';

import 'package:cotec/core/app_export.dart';

class LogTestScreenController extends GetxController {
  TextEditingController testTypeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ptsNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController bNumberController = TextEditingController();
  TextEditingController cNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  RxBool nameValidate = false.obs;
  RxBool ptsValidate = false.obs;
  RxBool companyValidate = false.obs;
  RxBool testTypeValidate = false.obs;
  RxBool bNumberValidate = false.obs;
  RxBool cNumberValidate = false.obs;
  RxBool locationValidate = false.obs;

  final List<String> items = [
    AppString.isolationPreTest,
    AppString.isolationDead,
    AppString.testBefore,
    AppString.reinstateLive,
  ];
  RxString selectedValue = AppString.isolationPreTest.obs;
  RxString selectedValueDrop = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void next() {
    if (selectedValueDrop.isEmpty) {
      testTypeValidate.value = true;
    } else {
      testTypeValidate.value = false;
    }
    if (nameController.text.isEmpty) {
      nameValidate.value = true;
    } else {
      nameValidate.value = false;
    }
    if (ptsNumberController.text.isEmpty) {
      ptsValidate.value = true;
    } else {
      ptsValidate.value = false;
    }
    if (companyNameController.text.isEmpty) {
      companyValidate.value = true;
    } else {
      companyValidate.value = false;
    }
    if (bNumberController.text.isEmpty) {
      bNumberValidate.value = true;
    } else {
      bNumberValidate.value = false;
    }
    if (cNumberController.text.isEmpty) {
      cNumberValidate.value = true;
    } else {
      cNumberValidate.value = false;
    }
    if (locationController.text.isEmpty) {
      locationValidate.value = true;
    } else {
      locationValidate.value = false;
    }
  }
}
