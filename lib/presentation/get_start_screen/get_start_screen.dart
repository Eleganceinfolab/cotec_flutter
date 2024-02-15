import 'package:cotec/widgets/custom_elavated_button.dart';

import '../../core/app_export.dart';
import 'controller/get_start_screen_controller.dart';

class GetStartScreen extends GetWidget<GetStartScreenController> {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),

        body: Stack(
          children: [
            Column(
              children: [
                CommonAppbar(hasBack: false),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getWidth(47),
                       right: getWidth(47),
                       bottom: getHeight(30),
                        ),
                  child: AppElevatedButton(
                    hasBoxShadow: true,
                    buttonName: AppString.getStartedCamelCase,
                    onPressed: () {
                      Get.toNamed(AppRoutes.homeScreenRoute);
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(33)
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.appLogo,
                ),
              ),
            ),
          ],
        ));
  }
}
