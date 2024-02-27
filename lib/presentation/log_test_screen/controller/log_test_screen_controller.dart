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
  RxBool checkBoxValidate = false.obs;
  RxBool ptsValidate = false.obs;
  RxBool companyValidate = false.obs;
  RxBool testTypeValidate = false.obs;
  RxBool bNumberValidate = false.obs;
  RxBool cNumberValidate = false.obs;
  RxBool locationValidate = false.obs;
  RxBool isAllValidate = true.obs;

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

  void onChangeCheckBox() {
    checkBoxValidate.value = !checkBoxValidate.value;
  }

  void clearAll() {
    nameController.clear();
    ptsNumberController.clear();
    companyNameController.clear();
    bNumberController.clear();
    cNumberController.clear();
    locationController.clear();
    selectedValueDrop.value = '';
  }

  void next(BuildContext context) {
    if (isAllValidate.value) {
      if (selectedValueDrop.isEmpty) {
        testTypeValidate.value = true;
        isAllValidate.value = true;
      } else {
        testTypeValidate.value = false;
        isAllValidate.value = false;
      }
      if (nameController.text.isEmpty) {
        nameValidate.value = true;
        isAllValidate.value = true;
      } else {
        nameValidate.value = false;
        isAllValidate.value = false;
      }
      if (ptsNumberController.text.isEmpty) {
        ptsValidate.value = true;
        isAllValidate.value = true;
      } else {
        ptsValidate.value = false;
        isAllValidate.value = false;
      }
      if (companyNameController.text.isEmpty) {
        companyValidate.value = true;
        isAllValidate.value = true;
      } else {
        companyValidate.value = false;
        isAllValidate.value = false;
      }
      if (bNumberController.text.isEmpty) {
        bNumberValidate.value = true;
        isAllValidate.value = true;
      } else {
        bNumberValidate.value = false;
        isAllValidate.value = false;
      }

      // if (locationController.text.isEmpty) {
      //   locationValidate.value = true;
      //   isAllValidate.value = true;
      // } else {
      //   locationValidate.value = false;
      //   isAllValidate.value = false;
      // }
    } else {
      if (!checkBoxValidate.value) {
        fieldsMissedDialog(context);
      } else {
        Get.offAndToNamed(AppRoutes.activeTestScreenRoute);
      }
      print('object == ${checkBoxValidate.value}');
      print('object == ${isAllValidate.value}');
    }
  }

  void fieldsMissedDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.fieldsMiss,
                style: CTC.style(21,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.textBlackToYellow(context)),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Center(
              child: Text(
                AppString.fieldsMissText,
                textAlign: TextAlign.center,
                style: CTC.style(14,
                    fontColor: ColorConstant.textBlackToWhite(context)),
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
          ],
        ),
        firstButtonTitle: AppString.proceed,
        firstOnPressed: () {
          Get.back();
        },
        context: context);
  }
}
