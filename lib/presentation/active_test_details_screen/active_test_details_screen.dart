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
        backgroundColor: ColorConstant.backGroundColor,
        appBar: const CommonAppbar(title: AppString.activeTest),
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
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5.0,
                            spreadRadius: 0.5),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstant.primaryWhite),
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
                      const Divider(
                        color: ColorConstant.text00,
                      ),
                      SizedBox(
                        height: getHeight(25),
                      ),
                      itemNameValue(AppString.startUp, '09:18 AM',
                          isSize: true),
                      itemNameValue(AppString.voltsDetected, '09:20 AM',
                          isSize: true),
                      itemNameValue(AppString.duration, '3:17 Minutes',
                          isSize: true),
                      itemNameValue(AppString.voltsHie, '3.98 kV',
                          isSize: true),
                      itemNameValue(AppString.voltLow, '2.09 kV', isSize: true),
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
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5.0,
                            spreadRadius: 0.5),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstant.primaryWhite),
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
                                  fontColor: ColorConstant.primaryBlue),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Isolation Pre-Test - Energised',
                              style: CTC.style(14,
                                  fontWeight: FontWeight.w500,
                                  fontColor: ColorConstant.primaryBlue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(5),
                      ),
                      itemNameValue(AppString.fullName, 'James Hunt'),
                      itemNameValue(AppString.ptsNumber, 'PTS123NUM'),
                      itemNameValue(
                          AppString.companyName, 'Company Name > Depot'),
                      itemNameValue(AppString.fromBNumber, 'FORMBNUM'),
                      itemNameValue(AppString.fromCNumber, 'FORMCNUM'),
                      itemNameValue(AppString.location, 'Location Name')
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
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5.0,
                            spreadRadius: 0.5),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstant.primaryWhite),
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(18), vertical: getHeight(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.addLicencePhoto,
                        style: CTC.style(
                          16,
                          fontWeight: FontWeight.w500,
                        ),
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
                                      color: ColorConstant.primaryWhite,
                                      border: Border.all(
                                          color: ColorConstant.greyD3),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getWidth(20),
                                      vertical: getHeight(17)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Obx(
                                          () => Text(
                                            controller.image.value.isEmpty
                                                ? 'Licence.jpg'
                                                : controller.image.value,
                                            maxLines: 1,
                                            style: CTC.style(14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Bounce(
                                          onTap: () {
                                            controller.image.value = '';
                                          },
                                          child: CustomImageView(
                                            svgPath: ImageConstant.fillClose,
                                          ))
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
                        ),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      CustomAppTextFormField(
                        maxLines: 3,
                        hintText: AppString.enterNotes,
                        borderRadius: BorderRadius.circular(5),
                        borderColor: ColorConstant.text00,
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
                    createLogDialog(context);
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

  Widget itemNameValue(String title, String value, {bool isSize = false}) {
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
                    fontColor: ColorConstant.primaryBlue),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: CTC.style(14,
                    fontWeight: FontWeight.w500,
                    fontColor: ColorConstant.primaryBlue),
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
                style: CTC.style(24,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.primaryBlue),
              ),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Text(
              AppString.createLogText,
              style: CTC.style(14),
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
                  buttonColor: ColorConstant.primaryWhite,
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
