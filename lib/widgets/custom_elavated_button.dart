import 'package:cotec/widgets/bouncing_button.dart';

import '../core/app_export.dart';

class AppElevatedButton extends StatelessWidget {
  final String buttonName;
  final void Function() onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final Color? buttonShadowColor;
  final FontWeight? fontWeight;
  final double? radius;
  final bool? isLoading;
  final double? fontSize;
  final bool? showTextIcon;
  bool? hasGradient = true;
  final String? textIcon;
  final String? svgPath;
  final Color? borderColor;

  AppElevatedButton(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      this.textColor,
      this.textIcon,
      this.borderColor,
      this.fontWeight,
      this.fontSize,
      this.buttonColor,
      this.radius,
      this.showTextIcon,
      this.hasGradient = true,
      this.isLoading = false,
      this.buttonShadowColor,
      this.svgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: getHeight(45),
        decoration: BoxDecoration(
          border: hasGradient ?? false
              ? null
              : Border.all(
                  color: ColorConstant.primaryBlue, width: getHeight(1)),
          color: buttonColor ?? ColorConstant.primaryYellow,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            disabledForegroundColor: ColorConstant.primaryYellow,
            disabledBackgroundColor: buttonColor ?? ColorConstant.primaryYellow,
            foregroundColor: ColorConstant.primaryYellow,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: buttonColor ?? ColorConstant.primaryYellow,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          child: !isLoading!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showTextIcon ?? false
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomImageView(
                              svgPath: svgPath,
                            ),
                          )
                        : const SizedBox(),
                    Text(
                      buttonName.toString(),
                      style: CTC.style(
                        fontSize?.toInt() ?? 16,
                        fontColor: textColor ?? ColorConstant.primaryBlue,
                        fontWeight: fontWeight ?? FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  height: getHeight(30),
                  width: getHeight(30),
                  child: const CircularProgressIndicator(
                    color: ColorConstant.primaryWhite,
                    strokeWidth: 2,
                  )),
        ),
      ),
    );
  }
}
