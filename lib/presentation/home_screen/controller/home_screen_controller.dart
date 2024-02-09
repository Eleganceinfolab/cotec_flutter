import 'dart:async';

import 'package:cotec/core/app_export.dart';
import 'package:cotec/core/utils/common_constant.dart';

class HomeScreenController extends GetxController {
  RxInt selectedDevice = 0.obs;
  RxString connectedDevice = ''.obs;

  List deviceList = [
    'C-31886',
    'C-31887',
    'C-31888',
    'C-31889',
  ];

  void deviceSelect(int index) {
    selectedDevice.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  List<HomeMenu> choices = <HomeMenu>[
    HomeMenu(
        type: 'logTest',
        title: AppString.logTest,
        image: ImageConstant.logTest),
    HomeMenu(
        type: 'measureVolts',
        title: AppString.measureVolts,
        image: ImageConstant.logTest),
    HomeMenu(type: 'logs', title: AppString.logs, image: ImageConstant.logs),
    HomeMenu(
        type: 'userManual',
        title: AppString.userManual,
        image: ImageConstant.userManual),
    HomeMenu(
        type: 'scanForDevices',
        title: AppString.scanForDevices,
        image: ImageConstant.bluetooth),
    HomeMenu(
        type: 'setting',
        title: AppString.setting,
        image: ImageConstant.setting),
  ];

  void cardTap(String type, BuildContext context) {
    switch (type) {
      case 'logTest':
        Get.toNamed(AppRoutes.logTestScreenRoute);
        // do something
        break;
      case 'measureVolts':
        // do something else
        Get.toNamed(AppRoutes.activeTestScreenRoute);

        break;
      case 'logs':
        Get.toNamed(AppRoutes.logListScreenRoute);

        // do something else
        break;
      case 'userManual':
        // do something else
        break;
      case 'scanForDevices':
        deviceDialog(context);
        break;
      case 'setting':
        enterPinDialog(context);
        // do something else
        break;
    }
  }

  void syncData(BuildContext context) {
    reachingLogsLimit(context);
  }

  Future deviceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SimpleDialog(
          backgroundColor: ColorConstant.containerBackGround(context),
          surfaceTintColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
          contentPadding: EdgeInsets.symmetric(
              horizontal: getWidth(25), vertical: getHeight(30)),
          children: [
            Text(
              AppString.deviceList,
              style: CTC.style(26,
                  fontWeight: FontWeight.w600,
                  fontColor: ColorConstant.textBlackToYellow(context)),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            SizedBox(
              height: constraints.maxHeight * .18, // 70% height
              width: constraints.maxWidth * .9,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: deviceList.length,
                itemBuilder: ((context, index) {
                  return Obx(
                    () => Bounce(
                      onTap: () {
                        deviceSelect(index);
                        connectedDevice.value = deviceList[index];
                        licenseKeyDialog(context);

                        // Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: getHeight(5)),
                        decoration: BoxDecoration(
                            color: selectedDevice.value == index
                                ? ColorConstant.backGroundGreyColor
                                : ColorConstant.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(20), vertical: getHeight(7)),
                        child: Text(
                          deviceList[index],
                          style: CTC.style(21,
                              fontWeight: FontWeight.w500,
                              fontColor: selectedDevice.value == index
                                  ? ColorConstant.textBlack
                                  : ColorConstant.textBlackToWhite(context)),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            AppElevatedButton(
                buttonName: AppString.cancel,
                onPressed: () {
                  Get.back();
                }),
            SizedBox(
              height: getHeight(10),
            ),
          ],
        ),
      ),
    );
  }

  void licenseKeyDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.confirmLicenseKey,
                style: CTC.style(26,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.textBlackToYellow(context)),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Center(
              child: Text(
                AppString.enterLicenseKey,
                textAlign: TextAlign.center,
                style: CTC.style(16,
                    fontColor: ColorConstant.textGrey4c4cToWhite(context)),
              ),
            ),
            SizedBox(
              height: getHeight(24),
            ),
            Text(
              AppString.licenseKey,
              style: CTC.style(16,
                  fontColor: ColorConstant.text00ToWhite(context),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            CustomAppTextFormField(
              fillColor: ColorConstant.greyF5,
              hintText: AppString.enterHere,
              borderRadius: BorderRadius.circular(18),
              hintFontStyle: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.grey9DA),
            ),
            SizedBox(
              height: getHeight(15),
            ),
          ],
        ),
        firstButtonTitle: AppString.confirm,
        firstOnPressed: () {
          Get.back();
          Get.back();
        },
        secondButtonTitle: AppString.cancel,
        secondOnPressed: () {
          Get.back();
          Get.back();
        },
        context: context);
  }

  void enterPinDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.enterPin,
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
                AppString.enterPinSettingText,
                textAlign: TextAlign.center,
                style: CTC.style(16,
                    fontColor: ColorConstant.textBlackToWhite(context)),
              ),
            ),
            SizedBox(
              height: getHeight(24),
            ),
            Text(
              AppString.securityPin,
              style: CTC.style(14,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.textBlackToWhite(context)),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            CustomAppTextFormField(
              fillColor: ColorConstant.primaryWhite,
              hintText: AppString.hide,
              borderColor: ColorConstant.greyD3,
              borderRadius: BorderRadius.circular(5),
              hintFontStyle: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.grey9DA),
            ),
            SizedBox(
              height: getHeight(8),
            ),
          ],
        ),
        firstButtonTitle: AppString.submit,
        firstOnPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.settingScreenRoute);
        },
        context: context);
  }

  void reachingLogsLimit(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.reachingLogsLimit,
                style: CTC.style(21,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.text00ToYellow(context)),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Center(
              child: Text(
                AppString.reachingLogsLimitDes,
                textAlign: TextAlign.center,
                style: CTC.style(16,
                    fontColor: ColorConstant.textGrey4c4cToWhite(context)),
              ),
            ),
            SizedBox(
              height: getHeight(24),
            ),
          ],
        ),
        firstButtonTitle: AppString.ok,
        firstOnPressed: () {
          Get.back();
          reachingLogsLimitReached(context);
        },
        context: context);
  }

  void reachingLogsLimitReached(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.reachingLogsLimitReached,
                style: CTC.style(21,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.text00ToYellow(context)),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Center(
              child: Text(
                AppString.reachingLogsLimitReachedDes,
                textAlign: TextAlign.center,
                style: CTC.style(16,
                    fontColor: ColorConstant.textGrey4c4cToWhite(context)),
              ),
            ),
            SizedBox(
              height: getHeight(24),
            ),
          ],
        ),
        firstButtonTitle: AppString.ok,
        firstOnPressed: () {
          Get.back();
        },
        context: context);
  }
}

class HomeMenu {
  const HomeMenu(
      {required this.title, required this.image, required this.type});
  final String title;
  final String image;
  final String type;
}
