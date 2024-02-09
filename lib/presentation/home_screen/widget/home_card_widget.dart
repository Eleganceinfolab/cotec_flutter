import 'package:cotec/widgets/bouncing_button.dart';

import '../../../core/app_export.dart';
import '../controller/home_screen_controller.dart';

class HomeMenuCard extends StatelessWidget {
  const HomeMenuCard(
      {Key? key,
      required this.homeMenu,
      required this.onTap,
      this.connected = false,
      this.deviceName})
      : super(key: key);
  final HomeMenu homeMenu;
  final bool connected;
  final String? deviceName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Card(
          color: ColorConstant.containerBackGround(context),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(11),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: getHeight(23),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.primaryBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: getHeight(10), vertical: getHeight(10)),
                    child: CustomImageView(
                      svgPath: homeMenu.image,
                      height: getHeight(35),
                      width: getHeight(35),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(17),
                  ),
                  if (!connected)
                    Text(homeMenu.title,
                        style: CTC.style(18,
                            fontWeight: FontWeight.w600,
                            fontColor:
                                ColorConstant.textBlackToWhite(context))),
                  if (connected)
                    Text(AppString.disconnect,
                        style: CTC.style(18,
                            fontWeight: FontWeight.w600,
                            fontColor:
                                ColorConstant.textBlackToWhite(context))),
                  if (connected && deviceName != null)
                    Text(deviceName ?? '',
                        style: CTC.style(18,
                            fontWeight: FontWeight.w600,
                            fontColor: ColorConstant.primaryYellow)),
                  SizedBox(
                    height: getHeight(10),
                  ),
                ]),
          )),
    );
  }
}
