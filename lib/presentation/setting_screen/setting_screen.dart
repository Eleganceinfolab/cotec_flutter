import 'package:cotec/core/app_export.dart';

import 'controller/setting_screen_controller.dart';

class SettingScreen extends GetWidget<SettingScreenController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backGroundColor,
        appBar: const CommonAppbar(title: AppString.setting),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(30),
                ),
                listTileList(
                  title: AppString.changePin,
                  svgPath: ImageConstant.changePin,
                  onTap: () {
                    confirmLicenseDialog(context);
                  },
                ),
                listTileList(
                  title: AppString.setCompanyName,
                  svgPath: ImageConstant.company,
                  onTap: () {
                    setCompanyNameDialog(context);
                  },
                ),
                listTileList(
                  title: AppString.clearAppData,
                  svgPath: ImageConstant.clearData,
                  onTap: () {},
                ),
                listTileList(
                  title: AppString.themes,
                  svgPath: ImageConstant.theme,
                  onTap: () {},
                ),
                listTileList(
                  title: AppString.largerFont,
                  svgPath: ImageConstant.font,
                  onTap: () {},
                ),
                listTileList(
                  title: AppString.tones,
                  svgPath: ImageConstant.music,
                  onTap: () {},
                ),
                listTileList(
                  title: AppString.storingLogOffline,
                  svgPath: ImageConstant.storeLog,
                  onTap: () {
                    storingOfflineDialog(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget listTileList(
      {required String title,
      required String svgPath,
      required void Function() onTap}) {
    return Column(
      children: [
        Bounce(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      spreadRadius: 0.5),
                ],
                borderRadius: BorderRadius.circular(15),
                color: ColorConstant.primaryWhite),
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(12), vertical: getHeight(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: svgPath,
                ),
                SizedBox(
                  width: getWidth(10),
                ),
                Text(
                  title,
                  style: CTC.style(16,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.primaryBlue),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: getHeight(20),
        )
      ],
    );
  }

  void setCompanyNameDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        radius: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.setCompanyName,
                style: CTC.style(21, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Text(
              AppString.companyName,
              style: CTC.style(14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            CustomAppTextFormField(
              fillColor: ColorConstant.primaryWhite,
              hintText: AppString.companyName,
              borderColor: ColorConstant.greyD3,
              borderRadius: BorderRadius.circular(5),
              hintFontStyle: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.grey9DA),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            Text(
              AppString.depot,
              style: CTC.style(14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            CustomAppTextFormField(
              fillColor: ColorConstant.primaryWhite,
              hintText: AppString.depot,
              borderColor: ColorConstant.greyD3,
              borderRadius: BorderRadius.circular(5),
              hintFontStyle: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.grey9DA),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Row(
              children: [
                Expanded(
                    child: AppElevatedButton(
                  buttonName: AppString.close,
                  onPressed: () {
                    Get.back();
                  },
                )),
                SizedBox(
                  width: getWidth(10),
                ),
                Expanded(
                    child: AppElevatedButton(
                  buttonName: AppString.submit,
                  onPressed: () {},
                ))
              ],
            )
          ],
        ),
        context: context);
  }

  void storingOfflineDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        radius: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.storingLogOffline,
                style: CTC.style(21,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.primaryBlue),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Text(
              AppString.storeText,
              textAlign: TextAlign.center,
              style: CTC.style(14,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.primaryBlue),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Obx(
              () => RadioListTile<Type>(
                title: Text(
                  AppString.storeDeleting,
                  style: CTC.style(18,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.primaryBlue),
                ),
                fillColor:
                    MaterialStatePropertyAll(ColorConstant.primaryYellow),
                value: Type.stop,
                groupValue: controller.type.value,
                onChanged: (Type? value) {
                  controller.type.value = value!;
                },
              ),
            ),
            SizedBox(
              height: getHeight(20),
            ),
            Obx(
              () => RadioListTile<Type>(
                title: Text(
                  AppString.overwrite,
                  style: CTC.style(18,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.primaryBlue),
                ),
                fillColor:
                    MaterialStatePropertyAll(ColorConstant.primaryYellow),
                value: Type.over,
                groupValue: controller.type.value,
                onChanged: (Type? value) {
                  controller.type.value = value!;
                },
              ),
            ),
            SizedBox(
              height: getHeight(30),
            ),
          ],
        ),
        context: context);
  }

  void confirmLicenseDialog(BuildContext context) {
    return CommonConstant.instance.commonShowDialogs(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppString.confirmLicense,
                style: CTC.style(21, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Center(
              child: Text(
                AppString.confirmLicenseText,
                textAlign: TextAlign.center,
                style: CTC.style(16),
              ),
            ),
            SizedBox(
              height: getHeight(24),
            ),
            Text(
              AppString.licenseKey,
              style: CTC.style(14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            CustomAppTextFormField(
              fillColor: ColorConstant.primaryWhite,
              hintText: AppString.licenseKey,
              borderColor: ColorConstant.greyD3,
              borderRadius: BorderRadius.circular(5),
              hintFontStyle: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.grey9DA),
            ),
            SizedBox(
              height: getHeight(20),
            ),
            Text(
              AppString.companyName,
              style: CTC.style(14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            CustomAppTextFormField(
              fillColor: ColorConstant.primaryWhite,
              hintText: AppString.companyName,
              borderColor: ColorConstant.greyD3,
              borderRadius: BorderRadius.circular(5),
              hintFontStyle: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.grey9DA),
            ),
            SizedBox(
              height: getHeight(20),
            ),
          ],
        ),
        firstButtonTitle: AppString.submit,
        firstOnPressed: () {
          Get.back();
        },
        context: context);
  }
}
