import 'dart:ffi';

import 'package:cotec/core/app_export.dart';
import 'package:image_picker/image_picker.dart';

import 'controller/active_test_details_screen_controller.dart';

class ActiveTestDetailScreen
    extends GetWidget<ActiveTestDetailScreenController> {
  const ActiveTestDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        appBar: const CommonAppbar(title: AppString.createLog),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getHeight(10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          '8.51 kV',
                          style: CTC.style(50,
                              fontWeight: FontWeight.bold,
                              fontColor: ColorConstant.primaryYellow),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      Divider(
                        color: ColorConstant.textGrey4c4cToWhite(context),
                      ),
                      SizedBox(
                        height: getHeight(25),
                      ),
                      itemNameValue(AppString.startUp, '09:18 AM', context,
                          isSize: true),
                      itemNameValue(
                          AppString.voltsDetected, '09:20 AM', context,
                          isSize: true),
                      itemNameValue(AppString.duration, '3:17 Minutes', context,
                          isSize: true),
                      itemNameValue(AppString.voltsHie, '3.98 kV', context,
                          isSize: true),
                      itemNameValue(AppString.voltLow, '2.09 kV', context,
                          isSize: true),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
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
                                      ColorConstant.textDarkTOLight(context)),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Isolation Pre-Test - Energised',
                              style: CTC.style(14,
                                  fontWeight: FontWeight.w500,
                                  fontColor:
                                      ColorConstant.textDarkTOLight(context)),
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
                        AppString.location,
                        'Location Name',
                        context,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(30),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.addTestImage,
                        style: CTC.style(16,
                            fontWeight: FontWeight.w500,
                            fontColor: ColorConstant.textBlackToWhite(context)),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: ColorConstant.primaryBlue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(20),
                                vertical: getHeight(10)),
                            child: CustomImageView(
                              svgPath: ImageConstant.upload,
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: ColorConstant.primaryWhite,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getWidth(20),
                                            vertical: getHeight(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  controller.pickImages(
                                                      ImageSource.camera);
                                                },
                                                icon: Icon(
                                                  Icons.camera,
                                                  size: 50,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  controller.pickImages(
                                                      ImageSource.gallery);
                                                },
                                                icon: Icon(
                                                  Icons.image,
                                                  size: 50,
                                                )),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? ColorConstant.primaryWhite
                                          : ColorConstant.greyDCDC,
                                      border: Border.all(
                                          color: ColorConstant.greyD3),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  padding: EdgeInsets.only(
                                    left: getWidth(8),
                                    right: getWidth(8),
                                    top: getHeight(17),
                                    bottom: getHeight(17),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Obx(
                                          () => Text(
                                            controller.image.value.isEmpty
                                                ? 'Select Test Image'
                                                : controller.image.value,
                                            maxLines: 1,
                                            style: CTC.style(14,
                                                fontColor: controller
                                                        .image.value.isEmpty
                                                    ? Colors.grey
                                                    : ColorConstant.textBlack,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: getWidth(4),
                                      ),
                                      Obx(
                                        () => !controller.image.value.isEmpty
                                            ? Bounce(
                                                onTap: () {
                                                  controller.image.value = '';
                                                },
                                                child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.fillClose,
                                                ))
                                            : SizedBox.shrink(),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Text(
                        AppString.addNotes,
                        style: CTC.style(
                          16,
                          fontWeight: FontWeight.w500,
                          fontColor: ColorConstant.textBlackToWhite(context),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      CustomAppTextFormField(
                        maxLines: 3,
                        fontStyle: CTC.style(16,
                            fontWeight: FontWeight.w500,
                            fontColor: ColorConstant.grey9DA),
                        hintText: AppString.enterNotes,
                        fillColor: ColorConstant.containerBackGround(context),
                        borderRadius: BorderRadius.circular(5),
                        hintFontStyle: CTC.style(16,
                            fontWeight: FontWeight.w500,
                            fontColor: ColorConstant.grey9DA),
                        borderColor: ColorConstant.text00ToWhite(context),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                AppElevatedButton(
                  buttonName: AppString.createLog,
                  onPressed: () {
                    Get.toNamed(AppRoutes.logListScreenRoute);
                  },
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                AppElevatedButton(
                  borderColor: ColorConstant.primaryBlue,
                  hasGradient: false,
                  textColor: ColorConstant.textBlueToYellow(context),
                  buttonColor: ColorConstant.backgroundColor(context),
                  buttonName: AppString.retry,
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  height: getHeight(30),
                ),
              ],
            ),
          ),
        ));
  }

  Widget itemNameValue(String title, String value, BuildContext context,
      {bool isSize = false}) {
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
                    fontColor: ColorConstant.textDarkTOLight(context)),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: CTC.style(14,
                    fontWeight: FontWeight.w500,
                    fontColor: ColorConstant.textDarkTOLight(context)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getHeight(isSize ? 10 : 5),
        ),
      ],
    );
  }

  void createLogDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        radius: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.createLog,
                textAlign: TextAlign.center,
                style: CTC.style(24,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.textBlueToYellow(context)),
              ),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Center(
              child: Text(
                AppString.createLogText,
                textAlign: TextAlign.center,
                style: CTC.style(14,
                    fontColor: ColorConstant.textBlackToWhite(context)),
              ),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Row(
              children: [
                Expanded(
                    child: AppElevatedButton(
                  borderColor: ColorConstant.primaryBlue,
                  hasGradient: false,
                  textColor: ColorConstant.textBlueToYellow(context),
                  buttonColor: ColorConstant.containerBackGround(context),
                  buttonName: AppString.retry,
                  onPressed: () {
                    Get.back();
                  },
                )),
                SizedBox(
                  width: getWidth(11),
                ),
                Expanded(
                    child: AppElevatedButton(
                  buttonName: AppString.accept,
                  onPressed: () {
                    Get.back();
                  },
                ))
              ],
            )
          ],
        ),
        context: context);
  }
}
