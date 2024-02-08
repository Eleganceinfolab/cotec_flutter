import 'dart:async';

import 'package:cotec/core/app_export.dart';

import '../active_test_screen.dart';

class ActiveTestScreenController extends GetxController {
  Rx<VoltMeterData> voltMeterData = VoltMeterData().obs;
  RxBool hasVoiceActive = false.obs;
  RxBool hasMeterView = false.obs;
  @override
  void onInit() {
    voltMeterData.value = VoltMeterData(
        color: ColorConstant.primaryGreen,
        endValue: 301,
        interval: 100,
        maximum: 301,
        value: 10,
        voltage: 'V');
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        voltMeterData.value = VoltMeterData(
            color: ColorConstant.primaryGreen,
            endValue: 301,
            interval: 100,
            maximum: 301,
            value: 0,
            voltage: 'V');
      },
    );

    super.onInit();
  }

  void next() {
    Get.toNamed(AppRoutes.activeTestDetailsScreenRoute);
  }
}
