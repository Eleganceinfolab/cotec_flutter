import 'package:cotec/core/app_export.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'controller/log_test_screen_controller.dart';

class LogTestScreen extends GetWidget<LogTestScreenController> {
  const LogTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        appBar: CommonAppbar(
          title: AppString.test,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(20), vertical: getHeight(20)),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.testType,
                        style: CTC.style(16,
                            fontWeight: FontWeight.w500,
                            fontColor: controller.testTypeValidate.value
                                ? ColorConstant.textRedFF
                                : ColorConstant.text00ToWhite(context)),
                      ),
                      if (controller.testTypeValidate.value)
                        Text(
                          ' - is required',
                          style: CTC.style(16,
                              fontWeight: FontWeight.w500,
                              fontColor: ColorConstant.textRedFF),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                    // isExpanded: true,
                    hint: Text(
                      AppString.selectTestType,
                      style: CTC.style(16, fontColor: ColorConstant.grey9DA),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: controller.items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: CTC.style(16,
                                    fontWeight: FontWeight.w500,
                                    fontColor:
                                        ColorConstant.textGrey4c4cToWhite(
                                            context)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: controller.selectedValueDrop.value.isEmpty
                        ? null
                        : controller.selectedValue.value,
                    onChanged: (String? value) {
                      if (value!.isNotEmpty) {
                        controller.testTypeValidate.value = false;
                      }
                      controller.selectedValue.value = value!;
                      controller.selectedValueDrop.value = value!;
                    },
                    buttonStyleData: ButtonStyleData(
                      height: getHeight(54),
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            color: controller.testTypeValidate.value
                                ? ColorConstant.textRedFF
                                : ColorConstant.transparent),
                        color: ColorConstant.containerBackGround(context),
                      ),
                    ),

                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                      iconSize: 24,
                      iconEnabledColor: controller.testTypeValidate.value
                          ? ColorConstant.textRedFF
                          : ColorConstant.text00ToWhite(context),
                    ),
                    isDense: true,
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: ColorConstant.containerBackGround(context),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                    style: CTC.style(14,
                        fontColor: ColorConstant.textBlackToWhite(context)),
                  ),
                  titleText(
                      context: context,
                      title: AppString.name,
                      hintText: AppString.enterHere,
                      isValidate: !controller.nameValidate.value,
                      onChanged: (p0) {
                        if (p0.isNotEmpty) {
                          controller.nameValidate.value = false;
                        }
                      },
                      textController: controller.nameController),
                  titleText(
                      context: context,
                      title: AppString.ptsNumber,
                      hintText: AppString.enterPTSNumber,
                      isValidate: !controller.ptsValidate.value,
                      onChanged: (p0) {
                        if (p0.isNotEmpty) {
                          controller.ptsValidate.value = false;
                        }
                      },
                      textController: controller.ptsNumberController),
                  titleText(
                      context: context,
                      title: AppString.companyName,
                      hintText: AppString.johnCompany,
                      isValidate: !controller.companyValidate.value,
                      fillColor: ColorConstant.backgroundTextField(context),
                      onChanged: (p0) {
                        if (p0.isNotEmpty) {
                          controller.companyValidate.value = false;
                        }
                      },
                      textController: controller.companyNameController),
                  titleText(
                      context: context,
                      title: AppString.fromBNumber,
                      hintText: AppString.enterBNumber,
                      isValidate: !controller.bNumberValidate.value,
                      onChanged: (p0) {
                        if (p0.isNotEmpty) {
                          controller.bNumberValidate.value = false;
                        }
                      },
                      textController: controller.bNumberController),
                  titleText(
                      context: context,
                      title: AppString.fromCNumber,
                      hintText: AppString.enterCNumber,
                      isValidate: !controller.cNumberValidate.value,
                      onChanged: (p0) {
                        if (p0.isNotEmpty) {
                          controller.cNumberValidate.value = false;
                        }
                      },
                      textController: controller.cNumberController),
                  titleText(
                      context: context,
                      title: AppString.location,
                      hintText: AppString.enterLocation,
                      onChanged: (p0) {
                        if (p0.isNotEmpty) {
                          controller.locationValidate.value = false;
                        }
                      },
                      isValidate: !controller.locationValidate.value,
                      textController: controller.locationController),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: AppElevatedButton(
                        buttonName: AppString.clearAll,
                        onPressed: () {
                          controller.clearAll();
                        },
                      )),
                      SizedBox(
                        width: getWidth(10),
                      ),
                      Expanded(
                          child: AppElevatedButton(
                        buttonName: AppString.proceedToTest,
                        onPressed: () {
                          controller.next();
                        },
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget titleText(
      {required String title,
      required bool isValidate,
      required BuildContext context,
      required Function(String) onChanged,
      Color? fillColor,
      required TextEditingController textController,
      required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: !isValidate
                      ? ColorConstant.textRedFF
                      : ColorConstant.text00ToWhite(context)),
            ),
            if (!isValidate)
              Text(
                AppString.isRequired,
                style: CTC.style(16,
                    fontWeight: FontWeight.w400,
                    fontColor: ColorConstant.textRedFF),
              ),
          ],
        ),
        SizedBox(
          height: getHeight(10),
        ),
        Form(
          child: CustomAppTextFormField(
            controller: textController,
            hintText: hintText,
            onChanged: onChanged,
            fillColor: fillColor ?? ColorConstant.containerBackGround(context),
            fontStyle: CTC.style(16,
                fontWeight: FontWeight.w500,
                fontColor: ColorConstant.textGrey4c4cToWhite(context)),
            hintFontStyle: CTC.style(16, fontColor: ColorConstant.grey9DA),
            borderColor: !isValidate
                ? ColorConstant.textRedFF
                : ColorConstant.transparent,
          ),
        ),
        SizedBox(
          height: getHeight(15),
        ),
      ],
    );
  }
}
