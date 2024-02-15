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
        appBar: const CommonAppbar(hasBack: false),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(65), vertical: getHeight(100)),
              child: CustomImageView(
                imagePath: ImageConstant.appLogo,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getHeight(40), horizontal: getWidth(47)),
              child: AppElevatedButton(
                hasBoxShadow: true,
                buttonName: AppString.getStartedCamelCase,
                onPressed: () {
                  Get.toNamed(AppRoutes.homeScreenRoute);
                },
              ),
            ),
          ],
        ));
  }
}
