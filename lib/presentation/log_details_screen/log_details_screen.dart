import 'package:cotec/core/app_export.dart';
import 'package:cotec/core/utils/common_constant.dart';

import 'controller/log_details_screen_controller.dart';

class LogDetailsScreen extends GetWidget<LogDetailsScreenController> {
  const LogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        appBar: const CommonAppbar(title: '202310050'),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.logNumber,
                        style: CTC.style(16,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorConstant.textDarkTOLight(context)),
                      ),
                      Text(
                        '202310050',
                        style: CTC.style(16,
                            fontWeight: FontWeight.w500,
                            fontColor: ColorConstant.textDarkTOLight(context)),
                      ),
                    ],
                  ),
                ),
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
                          AppString.location, 'Location Name', context)
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.gpsLocation,
                      style: CTC.style(16,
                          fontWeight: FontWeight.bold,
                          fontColor: ColorConstant.textDarkTOLight(context)),
                    ),
                    Text(
                      '40.748440, -73.984559',
                      style: CTC.style(16,
                          fontWeight: FontWeight.w500,
                          fontColor: ColorConstant.textDarkTOLight(context)),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(25),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.statusMessage,
                      style: CTC.style(16,
                          fontWeight: FontWeight.bold,
                          fontColor: ColorConstant.textDarkTOLight(context)),
                    ),
                    Text(
                      'Low Battery. Please recharge the device at the earliest opportunity.',
                      style: CTC.style(16,
                          fontWeight: FontWeight.w500,
                          fontColor: ColorConstant.textDarkTOLight(context)),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(25),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.deviceNumber,
                      style: CTC.style(16,
                          fontWeight: FontWeight.bold,
                          fontColor: ColorConstant.textDarkTOLight(context)),
                    ),
                    Text(
                      'C31e-XXXXX',
                      style: CTC.style(16,
                          fontWeight: FontWeight.w500,
                          fontColor: ColorConstant.textDarkTOLight(context)),
                    ),
                  ],
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
                      Text(
                        AppString.notes,
                        style: CTC.style(14,
                            fontWeight: FontWeight.w600,
                            fontColor: ColorConstant.textDarkTOLight(context)),
                      ),
                      SizedBox(
                        height: getHeight(5),
                      ),
                      Text(
                        'Lorem Ipsum has been the industry'
                        's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                        style: CTC.style(12,
                            fontWeight: FontWeight.w500,
                            fontColor: ColorConstant.textDarkTOLight(context)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                AppElevatedButton(
                  buttonName: AppString.downloadPDF,
                  onPressed: () {
                    CommonConstant.instance.commonShowDialogs(
                      child: dialogDownload(),
                      backgroundColor: ColorConstant.primaryWhite,
                      context: context,
                      firstButtonTitle: AppString.cancel,
                      firstOnPressed: () {
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                AppElevatedButton(
                  hasGradient: false,
                  buttonColor: ColorConstant.backgroundColor(context),
                  buttonName: AppString.shareLog,
                  textColor: ColorConstant.textBlueToYellow(context),
                  onPressed: () {},
                ),
                SizedBox(
                  height: getHeight(30),
                ),
              ],
            ),
          ),
        ));
  }

  Widget dialogDownload() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryBlue,
                        borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.all(20),
                    child: CustomImageView(
                      height: getHeight(40),
                      width: getHeight(40),
                      svgPath: ImageConstant.pdfCSV,
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  AppString.pdf,
                  style: CTC.style(16,
                      fontColor: ColorConstant.primaryBlue,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              children: [
                Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryBlue,
                        borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.all(20),
                    child: CustomImageView(
                      height: getHeight(40),
                      width: getHeight(40),
                      svgPath: ImageConstant.pdfCSV,
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  AppString.csv,
                  style: CTC.style(16,
                      fontColor: ColorConstant.primaryBlue,
                      fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: getHeight(10),
        ),
      ],
    );
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
}
