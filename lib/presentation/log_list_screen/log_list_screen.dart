import 'package:cotec/core/app_export.dart';
import 'controller/log_list_screen_controller.dart';

class LogListScreen extends GetWidget<LogListScreenController> {
  const LogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        appBar: const CommonAppbar(title: AppString.logs),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getHeight(17),
                  ),
                  CustomAppTextFormField(
                      borderRadius: BorderRadius.circular(50),
                      hintText: AppString.searchHere,
                      hintFontStyle: CTC.style(14),
                      onChanged: (p0) {
                        controller.filterSearchResults(p0);
                      },
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomImageView(
                          svgPath: ImageConstant.search,
                        ),
                      )),
                  Obx(
                    () => Column(
                      children: [
                        if (controller.selectedList.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: getHeight(20)),
                            child: AppElevatedButton(
                              showTextIcon: true,
                              svgPath: ImageConstant.download,
                              textColor: ColorConstant.yellowToBlack(context),
                              buttonColor:
                                  ColorConstant.textBlueToYellow(context),
                              buttonName: AppString.download,
                              svgColor: ColorConstant.yellowToBlack(context),
                              // textColor: ColorConstant.primaryYellow,
                              onPressed: () {},
                            ),
                          ),
                      ],
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      height: getHeight(
                          controller.selectedList.isNotEmpty ? 0 : 10),
                    ),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            controller.isSelected.value =
                                !controller.isSelected.value;
                            if (controller.isSelected.value) {
                              controller.selectedList
                                  .addAll(controller.searchList);
                            } else {
                              controller.selectedList.clear();
                            }
                            print(
                                'controller.selectedList ${controller.selectedList.length}');
                          },
                          icon: Icon(
                            controller.isSelected.value
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            size: getHeight(25),
                          ),
                          color: ColorConstant.primaryYellow,
                        ),
                      ),
                      Text(
                        AppString.selectAll,
                        style: CTC.style(18,
                            fontWeight: FontWeight.w600,
                            fontColor: ColorConstant.text00ToWhite(context)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.searchList.length,
                  itemBuilder: (context, index) {
                    var data = controller.searchList.value[index];

                    return Padding(
                      padding:
                          EdgeInsets.only(top: getHeight(index == 0 ? 10 : 0)),
                      child: Bounce(
                        onTap: () {
                          Get.toNamed(AppRoutes.logDetailsScreenRoute);
                        },
                        child: listItem(
                          context: context,
                          item: data,
                          isSelecteds: (bool value) {
                            if (value) {
                              controller.selectedList
                                  .add(controller.searchList[index]);
                            } else {
                              controller.selectedList
                                  .remove(controller.searchList[index]);
                            }
                            if (controller.selectedList.length ==
                                controller.searchList.length) {
                              controller.isSelected.value = true;
                            } else {
                              controller.isSelected.value = false;
                            }
                            print("$index : $value");
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }

  Widget listItem({
    required Item item,
    required ValueChanged<bool> isSelecteds,
    required BuildContext context,
  }) {
    RxBool isSelected = false.obs;

    return Row(
      children: [
        SizedBox(
          width: getWidth(16),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: getHeight(20)),
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
                borderRadius: BorderRadius.circular(20),
                color: ColorConstant.containerBackGround(context)),
            padding: EdgeInsets.only(right: getWidth(12), top: getHeight(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          isSelected.value = !isSelected.value;
                          isSelecteds(isSelected.value);
                          // if (isSelected.value) {
                          //   controller.selectedList.add(item);
                          // } else {
                          //   controller.selectedList.remove(item);
                          // }
                        },
                        icon: Icon(
                          !controller.selectedList.contains(item)
                              ? Icons.check_box_outline_blank
                              : Icons.check_box,
                          size: getHeight(25),
                        ),
                        color: ColorConstant.primaryYellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From B Number',
                            style: CTC.style(18,
                                fontWeight: FontWeight.w600,
                                fontColor:
                                    ColorConstant.textGrey4c4cToWhite(context)),
                          ),
                          SizedBox(
                            height: getHeight(10),
                          ),
                          Text(item.name,
                              style: CTC.style(
                                16,
                                fontColor:
                                    ColorConstant.textGrey4c4cToWhite(context),
                              )),
                          SizedBox(
                            height: getHeight(10),
                          ),
                          Text(item.date,
                              style: CTC.style(
                                16,
                                fontColor:
                                    ColorConstant.textGrey4c4cToWhite(context),
                              )),
                          SizedBox(
                            height: getHeight(10),
                          ),
                          Text(
                            item.type,
                            style: CTC.style(16,
                                fontColor:
                                    ColorConstant.textGrey4c4cToWhite(context)),
                          ),
                          SizedBox(
                            height: getHeight(20),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: getHeight(15),
                    color: ColorConstant.textGrey4c4cToWhite(context),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: getWidth(16),
        ),
      ],
    );
  }
}
