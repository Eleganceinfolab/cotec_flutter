import 'package:cotec/presentation/home_screen/widget/home_card_widget.dart';
import 'package:cotec/widgets/custom_elavated_button.dart';

import '../../core/app_export.dart';

import 'controller/home_screen_controller.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        appBar: const CommonAppbar(hasBack: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(45), vertical: getWidth(25)),
                  child: CustomImageView(
                    imagePath: ImageConstant.appLogo,
                  ),
                ),
                GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 2.5 / 2.7,
                    crossAxisSpacing: getWidth(15),
                    mainAxisSpacing: getHeight(5),
                    children: List.generate(controller.choices.length, (index) {
                      return Obx(
                        () => HomeMenuCard(
                          homeMenu: controller.choices[index],
                          connected: index == 4
                              ? controller.connectedDevice.value.isNotEmpty
                              : false,
                          deviceName: controller.connectedDevice.value,
                          onTap: () {
                            controller.cardTap(
                                controller.choices[index].type, context);
                          },
                        ),
                      );
                    })),
                SizedBox(
                  height: getHeight(27),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: getWidth(25), vertical: getHeight(20)),
                //   decoration: BoxDecoration(
                //     color: ColorConstant.primaryBlue,
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           CustomImageView(
                //             svgPath: ImageConstant.info,
                //           ),
                //           SizedBox(
                //             width: getWidth(8),
                //           ),
                //           Text(
                //             AppString.newDataBeen,
                //             style: CTC.style(16,
                //                 fontWeight: FontWeight.w600,
                //                 fontColor: ColorConstant.primaryWhite),
                //           )
                //         ],
                //       ),
                //       SizedBox(
                //         height: getHeight(8),
                //       ),
                //       AppElevatedButton(
                //         showTextIcon: true,
                //         svgPath: ImageConstant.sync,
                //         buttonName: AppString.syncData,
                //         onPressed: () {
                //           controller.syncData(context);
                //         },
                //       ),
                //       SizedBox(
                //         height: getHeight(10),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: getHeight(33),
                // ),
                Text(
                  '${AppString.dataLast}: 10:15AM 01/12/2022',
                  style: CTC.style(
                    16,
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.textBlackToWhite(context),
                  ),
                ),
                SizedBox(
                  height: getHeight(33),
                ),
              ],
            ),
          ),
        ));
  }
}
