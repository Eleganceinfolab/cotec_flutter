import '../core/app_export.dart';
import 'bouncing_button.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final void Function()? onTap;
  final void Function()? clearOnTap;
  final bool hasActions;
  final bool hasBack;
  const CommonAppbar(
      {Key? key,
      this.onTap,
      this.clearOnTap,
      this.title,
      this.hasActions = false,
      this.hasBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: ColorConstant.primaryBlue,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)

      ),
      backgroundColor: ColorConstant.primaryBlue,
      automaticallyImplyLeading: false,
      leading: hasBack
          ? Bounce(
              onTap: onTap ??
                  () {
                    Get.back();
                  },
              child: IconButton(
                onPressed: null,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: ColorConstant.primaryWhite,
                ),
              ))
          : null,
      actions: [
        hasActions
            ? Bounce(onTap: clearOnTap ?? () {}, child: const Icon(Icons.clear))
            : Container()
      ],
      centerTitle: true,
      title: title != null
          ? Text(
              title ?? '',
              style: CTC.style(16,
                  fontWeight: FontWeight.w500,
                  fontColor: ColorConstant.primaryWhite),
            )
          : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
