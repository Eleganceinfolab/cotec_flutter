import 'dart:developer';
import 'dart:io';

import 'package:cotec/widgets/custom_elavated_button.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app_export.dart';

class CommonConstant {
  CommonConstant._();

  static final instance = CommonConstant._();

  String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  Pattern phonePattern = r'(^[0-9 ]*$)';

  bool validateEmail(String email) {
    return RegExp(emailPattern).hasMatch(email);
  }

  String getFileExtension(String fileName) {
    return fileName.split('.').last;
  }

  String checkDeviceType() {
    if (kIsWeb) {
      return "Web";
    } else if (Platform.isIOS) {
      return "Ios";
    } else {
      return "Android";
    }
  }

  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.id}'); //
      return androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.identifierForVendor}');
      return iosInfo.identifierForVendor;
    }
  }

  Future<String> getFcmToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null && token.isNotEmpty) {
      log("<<<<<<>>>>>>" + token);
      return token;
    }
    return "";
  }

  Future<bool> requestFilePermission() async {
    late AndroidDeviceInfo androidInfo;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      try {
        androidInfo = await deviceInfo.androidInfo;
        print(androidInfo.version.sdkInt);
      } catch (e) {
        print('Failed to get Android device info: $e');
      }
    }
    PermissionStatus result;
    PermissionStatus resultAudio;
    if (Platform.isAndroid) {
      if (androidInfo.version.sdkInt >= 33) {
        result = await Permission.photos.request();
        resultAudio = await Permission.audio.request();
      } else {
        result = await Permission.storage.request();
        resultAudio = await Permission.audio.request();
      }
      if (androidInfo.version.sdkInt >= 33) {
        if (result.isGranted && resultAudio.isGranted) {
          return true;
        }
      } else {
        if (result.isGranted) {
          return true;
        }
      }
    } else {
      result = await Permission.photos.request();
      if (result.isGranted) {
        return true;
      }
    }
    return false;
  }

  Future<bool> requestLocationPermission() async {
    final permission = Permission.location;

    if (await permission.isDenied) {
      await permission.request();
    }
    if (await permission.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  CustomCupertinoBottomDilouge({
    String? headText,
    required String firstText,
    Color secondTextColor = ColorConstant.redWithOpecity,
    required Function firstTextOnTap,
    String? secondText,
    Function? secondTextOnTap,
    Function? cancelButtonTap,
    required BuildContext context,
  }) {
    final action = CupertinoActionSheet(
      actions: [
        if (headText != null)
          CupertinoActionSheetAction(onPressed: () {}, child: Text(headText)),
        CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              firstTextOnTap.call();
            },
            child: Text(
              firstText,
              style: CTC.style(20,
                  fontColor: ColorConstant.primaryRed,
                  fontWeight: FontWeight.bold),
            )),
        if (secondText != null || secondTextOnTap != null)
          CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                secondTextOnTap!.call();
              },
              child: Text(secondText ?? '',
                  style: CTC.style(20,
                      fontColor: ColorConstant.primaryRed,
                      fontWeight: FontWeight.bold))),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('Cancel',
            style: CTC.style(20,
                fontColor: ColorConstant.primaryBlack,
                fontWeight: FontWeight.bold)),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: context,
        builder: (context) => action,
        barrierColor: ColorConstant.primaryBlack.withOpacity(0.5));
  }

  void commonShowDialogs({
    required Widget child,
    required BuildContext context,
    String? firstButtonTitle,
    double? radius,
    void Function()? firstOnPressed,
    String? secondButtonTitle,
    void Function()? secondOnPressed,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            contentPadding: EdgeInsets.zero,
            backgroundColor: ColorConstant.primaryWhite,
            surfaceTintColor: ColorConstant.primaryWhite,
            content: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 20),
                color: ColorConstant.primaryWhite,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: getHeight(30), horizontal: getWidth(22)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  child,
                  SizedBox(
                    height: getHeight(10),
                  ),
                  firstButtonTitle != null
                      ? AppElevatedButton(
                          buttonName: firstButtonTitle,
                          onPressed: firstOnPressed ?? () {})
                      : SizedBox.shrink(),
                  secondButtonTitle != null
                      ? SizedBox(
                          height: getHeight(11),
                        )
                      : SizedBox.shrink(),
                  secondButtonTitle != null
                      ? AppElevatedButton(
                          hasGradient: false,
                          buttonColor: ColorConstant.primaryWhite,
                          buttonName: secondButtonTitle,
                          onPressed: secondOnPressed ?? () {})
                      : SizedBox.shrink(),
                ],
              ),
            ),
          );
        });
  }
}
