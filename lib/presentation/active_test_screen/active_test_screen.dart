import 'package:cotec/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'controller/active_test_screen_controller.dart';

class ActiveTestScreen extends GetWidget<ActiveTestScreenController> {
  const ActiveTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        appBar: CommonAppbar(
          title: AppString.activeTest,
          statusBarColor: ColorConstant.appBarColor(context),
          backgroundColor: ColorConstant.appBarColor(context),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(15),
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(
                                Theme.of(context).brightness == Brightness.light
                                    ? 0.3
                                    : 0.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.5),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstant.containerBackGround(context)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(10), vertical: getHeight(20)),
                  child: Column(
                    children: [
                      Obx(() => !controller.hasMeterView.value
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(getWidth(50)),
                              child: SfRadialGauge(
                                  // enableLoadingAnimation: true,
                                  backgroundColor:
                                      ColorConstant.containerBackGround(
                                          context),
                                  animationDuration: 4500,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      showFirstLabel: false,
                                      showTicks: false,
                                      showLabels: false,
                                      interval: controller
                                          .voltMeterData.value.interval,
                                      axisLineStyle: const AxisLineStyle(
                                          color: Colors.transparent,
                                          thickness: 15),
                                      maximum: controller
                                          .voltMeterData.value.maximum,
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          rangeOffset: 0,
                                          startValue: 0,
                                          endValue: controller
                                              .voltMeterData.value.endValue,
                                          color: Colors.transparent,
                                          endWidth: 25,
                                          startWidth: 25,
                                        ),
                                        // GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
                                        // GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
                                      ],
                                      tickOffset: 10,
                                      startAngle: 120,
                                      minorTickStyle: MinorTickStyle(
                                          length: 8,
                                          thickness: 3,
                                          color: ColorConstant.text00ToWhite(
                                              context)),
                                      majorTickStyle: MajorTickStyle(
                                          length: 12,
                                          thickness: 5,
                                          color: ColorConstant.text00ToWhite(
                                              context)),
                                      axisLabelStyle: GaugeTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: ColorConstant.text00ToWhite(
                                              context)),
                                      pointers: <GaugePointer>[
                                        NeedlePointer(
                                          needleEndWidth: 11,
                                          needleStartWidth: 0,
                                          value: 10,
                                          needleColor: ColorConstant.redF95,
                                          knobStyle: const KnobStyle(
                                              color: ColorConstant.greyE6E6,
                                              knobRadius: 0.12),
                                          // value: double.parse(randomValues.toString()),
                                          animationDuration: 1000,
                                          animationType: AnimationType.ease,
                                          enableAnimation: true,
                                          needleLength: 0.8,
                                        )
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                            widget: Text(
                                              controller.voltMeterData.value
                                                              .value ==
                                                          0.0 ||
                                                      controller.voltShow.value
                                                  ? '0\nV'
                                                  : '${controller.voltMeterData.value.value.toStringAsFixed(2)}\n${controller.voltMeterData.value.voltage}',
                                              key: ValueKey(controller
                                                  .voltMeterData.value
                                                  .toString()),
                                              textAlign: TextAlign.center,
                                              style: CTC.style(44,
                                                  fontColor: ColorConstant
                                                      .textGrey4c4cToWhite(
                                                          context),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            angle: 90,
                                            positionFactor: 0.7)
                                      ],
                                    ),
                                    RadialAxis(
                                      minimum: 0,
                                      interval: controller
                                          .voltMeterData.value.interval,
                                      axisLineStyle: const AxisLineStyle(
                                          color: Colors.transparent,
                                          thickness: 15),
                                      maximum: controller
                                          .voltMeterData.value.maximum,
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          rangeOffset: 0,
                                          startValue: 0,
                                          endValue: controller
                                              .voltMeterData.value.endValue,
                                          color: controller
                                              .voltMeterData.value.color,
                                          endWidth: 25,
                                          startWidth: 25,
                                        ),
                                        // GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
                                        // GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
                                      ],
                                      tickOffset: 10,
                                      startAngle: 130,
                                      minorTickStyle: MinorTickStyle(
                                          length: 8,
                                          thickness: 3,
                                          color: ColorConstant.text00ToWhite(
                                              context)),
                                      majorTickStyle: MajorTickStyle(
                                          length: 12,
                                          thickness: 5,
                                          color: ColorConstant.text00ToWhite(
                                              context)),
                                      axisLabelStyle: GaugeTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: ColorConstant.text00ToWhite(
                                              context)),
                                      pointers: <GaugePointer>[
                                        NeedlePointer(
                                          needleEndWidth: 11,
                                          needleStartWidth: 0,
                                          value: controller
                                              .voltMeterData.value.value,
                                          needleColor: Colors.transparent,
                                          knobStyle: const KnobStyle(
                                              color: Colors.transparent,
                                              knobRadius: 0.12),
                                          // value: double.parse(randomValues.toString()),
                                          animationDuration: 1000,
                                          animationType: AnimationType.ease,
                                          enableAnimation: true,
                                          needleLength: 0.8,
                                        )
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                            widget: Text(
                                              controller.voltMeterData.value
                                                              .value ==
                                                          0.0 ||
                                                      controller.voltShow.value
                                                  ? '0\nV'
                                                  : '${controller.voltMeterData.value.value.toStringAsFixed(2)}\n${controller.voltMeterData.value.voltage}',
                                              key: ValueKey(controller
                                                  .voltMeterData.value
                                                  .toString()),
                                              textAlign: TextAlign.center,
                                              style: CTC.style(44,
                                                  fontColor: ColorConstant
                                                      .textGrey4c4cToWhite(
                                                          context),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            angle: 90,
                                            positionFactor: 0.7)
                                      ],
                                    ),
                                  ]),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  bottom: getHeight(30), top: getHeight(30)),
                              decoration: BoxDecoration(
                                  color: ColorConstant.containerBackGround(
                                      context),
                                  border: Border.all(
                                      color: ColorConstant.redFF2, width: 3),
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.symmetric(
                                  vertical: getHeight(30),
                                  horizontal: getWidth(50)),
                              child: Column(
                                children: [
                                  Text(
                                    '20.0',
                                    style: CTC.style(90,
                                        fontWeight: FontWeight.w600,
                                        fontColor: ColorConstant.redFF2),
                                  ),
                                  Text(
                                    'KV',
                                    style: CTC.style(30,
                                        fontWeight: FontWeight.w600,
                                        fontColor: ColorConstant.redFF2),
                                  ),
                                ],
                              ),
                            )),
                      Bounce(
                        onTap: () {
                          // warningDetectDialog(context);

                          controller.next();
                        },
                        child: CustomImageView(
                          svgPath: ImageConstant.capture,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.manVoice,
                                color: ColorConstant.textDarkTOLight(context),
                              ),
                              SizedBox(
                                width: getWidth(5),
                              ),
                              Obx(
                                () => CupertinoSwitch(
                                  value: controller.hasVoiceActive.value,
                                  onChanged: (value) {
                                    controller.hasVoiceActive.value = value;
                                  },
                                  trackColor: ColorConstant.backGroundColor,
                                  thumbColor: controller.hasVoiceActive.value
                                      ? ColorConstant.primaryBlack
                                      : ColorConstant.primaryWhite,
                                  activeColor: ColorConstant.primaryYellow,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                AppString.meterView,
                                style: CTC.style(12,
                                    fontWeight: FontWeight.w600,
                                    fontColor: ColorConstant.textBlackToWhite(
                                        context)),
                              ),
                              SizedBox(
                                width: getWidth(5),
                              ),
                              Obx(
                                () => CupertinoSwitch(
                                  value: controller.hasMeterView.value,
                                  onChanged: (value) {
                                    controller.hasMeterView.value = value;
                                  },
                                  trackColor: ColorConstant.backGroundColor,
                                  thumbColor: controller.hasMeterView.value
                                      ? ColorConstant.primaryBlack
                                      : ColorConstant.primaryWhite,
                                  activeColor: ColorConstant.primaryYellow,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      Theme.of(context).brightness ==
                                              Brightness.light
                                          ? 0.2
                                          : 0),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.5),
                            ],
                            border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? ColorConstant.transparent
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConstant.containerBackGround(context)),
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(18), vertical: getHeight(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: ColorConstant.primaryGreen,
                                ),
                                SizedBox(
                                  width: getWidth(5),
                                ),
                                Text(
                                  AppString.link,
                                  style: CTC.style(15,
                                      fontWeight: FontWeight.w500,
                                      fontColor:
                                          ColorConstant.text00ToWhite(context)),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: ColorConstant.primaryGreen,
                                ),
                                SizedBox(
                                  width: getWidth(5),
                                ),
                                Text(
                                  AppString.gps,
                                  style: CTC.style(15,
                                      fontWeight: FontWeight.w500,
                                      fontColor:
                                          ColorConstant.text00ToWhite(context)),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: ColorConstant.textRedFF,
                                ),
                                SizedBox(
                                  width: getWidth(5),
                                ),
                                Text(
                                  AppString.status,
                                  style: CTC.style(15,
                                      fontWeight: FontWeight.w500,
                                      fontColor:
                                          ColorConstant.text00ToWhite(context)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15),
                      //       color: ColorConstant.primaryYellow),
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: getWidth(18), vertical: getHeight(10)),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           CustomImageView(
                      //             svgPath: ImageConstant.warning,
                      //           ),
                      //           SizedBox(
                      //             width: getWidth(10),
                      //           ),
                      //           Text(
                      //             AppString.lowBattery,
                      //             style: CTC.style(14,
                      //                 fontWeight: FontWeight.w600),
                      //           )
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: getHeight(15),
                      //       ),
                      //       Text(
                      //         AppString.lowBatteryDes,
                      //         style: CTC.style(12,
                      //             fontColor: ColorConstant.grey4c4c),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: getHeight(15),
                      // ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConstant.primaryYellow),
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(18), vertical: getHeight(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.warning,
                                ),
                                SizedBox(
                                  width: getWidth(10),
                                ),
                                Text(
                                  AppString.attentionCalibration,
                                  style: CTC.style(14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              height: getHeight(15),
                            ),
                            Text(
                              AppString.attentionCalibrationDes,
                              style: CTC.style(12,
                                  fontColor: ColorConstant.grey4c4c),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(25),
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(
                                Theme.of(context).brightness == Brightness.light
                                    ? 0.3
                                    : 0),
                            blurRadius: 5.0,
                            spreadRadius: 0.5),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstant.containerBackGround(context)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(18), vertical: getHeight(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              AppString.testTypes,
                              style: CTC.style(14,
                                  fontWeight: FontWeight.w600,
                                  fontColor:
                                      ColorConstant.textPrimaryBlackToWhite(
                                          context)),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Isolation Pre-Test - Energised',
                              style: CTC.style(14,
                                  fontWeight: FontWeight.w500,
                                  fontColor:
                                      ColorConstant.textPrimaryBlackToWhite(
                                          context)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(5),
                      ),
                      itemNameValue(AppString.fullName, 'James Hunt', context),
                      itemNameValue(AppString.ptsNumber, 'PTS123NUM', context),
                      itemNameValue(AppString.companyName,
                          'Company Name > Depot', context),
                      itemNameValue(AppString.fromBNumber, 'FORMBNUM', context),
                      itemNameValue(AppString.fromCNumber, 'FORMCNUM', context),
                      itemNameValue(
                          AppString.location, 'Location Name', context)
                    ],
                  ),
                ),
                // SizedBox(
                //   height: getHeight(25),
                // ),
                // AppElevatedButton(
                //   buttonName: AppString.confirm,
                //   onPressed: () {
                //     controller.next();
                //   },
                // ),
                SizedBox(
                  height: getHeight(25),
                ),
              ],
            ),
          ),
        ));
  }

  Widget itemNameValue(String title, String value, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '$title:',
                style: CTC.style(14,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.textPrimaryBlackToWhite(context)),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: CTC.style(14,
                    fontWeight: FontWeight.w500,
                    fontColor: ColorConstant.textPrimaryBlackToWhite(context)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getHeight(5),
        ),
      ],
    );
  }

  void warningDetectDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomImageView(
                svgPath: ImageConstant.warningRed,
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Center(
              child: Text(
                AppString.warningDetected,
                textAlign: TextAlign.center,
                style: CTC.style(24,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.text00ToYellow(context)),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Center(
              child: Text(
                AppString.warningDetectedDes,
                textAlign: TextAlign.center,
                style: CTC.style(14,
                    fontColor: ColorConstant.textGrey4c4cToWhite(context)),
              ),
            ),
            SizedBox(
              height: getHeight(24),
            ),
          ],
        ),
        firstButtonTitle: AppString.acknowledge,
        firstOnPressed: () {
          Get.back();
        },
        context: context);
  }
}

class VoltMeterData {
  double interval;
  double value;
  double endValue;
  double maximum;
  String voltage;
  Color color;
  VoltMeterData(
      {this.interval = 100,
      this.endValue = 301,
      this.value = 20,
      this.voltage = 'V',
      this.maximum = 301,
      this.color = ColorConstant.primaryGreen});
}
