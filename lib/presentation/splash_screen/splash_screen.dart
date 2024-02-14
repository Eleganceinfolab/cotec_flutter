import 'package:cotec/core/app_export.dart';
import 'package:cotec/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/splash_screen_controller.dart';


class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        body: Center(
          child: Lottie.asset(Theme.of(context).brightness == Brightness.light?'assets/animation/cotec_light_bg.json':'assets/animation/cotec_dark_bg.json'),
        ));
  }
}



