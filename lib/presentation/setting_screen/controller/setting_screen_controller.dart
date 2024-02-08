import 'dart:async';

import 'package:cotec/core/app_export.dart';

class SettingScreenController extends GetxController {
  Rx<Type> type = Type.stop.obs;

  @override
  void onInit() {
    super.onInit();
  }
}

enum Type { stop, over }
