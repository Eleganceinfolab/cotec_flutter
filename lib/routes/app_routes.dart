import 'package:cotec/presentation/active_test_details_screen/active_test_details_screen.dart';
import 'package:cotec/presentation/active_test_details_screen/binding/active_test_details_screen_binding.dart';
import 'package:cotec/presentation/active_test_screen/active_test_screen.dart';
import 'package:cotec/presentation/active_test_screen/binding/active_test_screen_binding.dart';
import 'package:cotec/presentation/get_start_screen/binding/get_start_screen_binding.dart';
import 'package:cotec/presentation/get_start_screen/get_start_screen.dart';
import 'package:cotec/presentation/home_screen/binding/home_screen_binding.dart';
import 'package:cotec/presentation/home_screen/home_screen.dart';
import 'package:cotec/presentation/log_details_screen/binding/log_details_screen_binding.dart';
import 'package:cotec/presentation/log_details_screen/log_details_screen.dart';
import 'package:cotec/presentation/log_list_screen/binding/log_list_screen_binding.dart';
import 'package:cotec/presentation/log_list_screen/log_list_screen.dart';
import 'package:cotec/presentation/log_test_screen/binding/log_test_screen_binding.dart';
import 'package:cotec/presentation/log_test_screen/log_test_screen.dart';
import 'package:cotec/presentation/setting_screen/binding/setting_screen_binding.dart';
import 'package:cotec/presentation/setting_screen/setting_screen.dart';
import 'package:get/get.dart';

import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String getStartScreenRoute = '/get_start_screen';
  static const String homeScreenRoute = '/home_screen';
  static const String logTestScreenRoute = '/log_Test_screen';
  static const String logListScreenRoute = '/log_List_screen';
  static const String logDetailsScreenRoute = '/log_details_screen';
  static const String settingScreenRoute = '/setting_screen';
  static const String activeTestScreenRoute = '/active_test_screen';
  static const String activeTestDetailsScreenRoute =
      '/active_test_details_screen';

  static List<GetPage> pages = [
    GetPage(
        name: splashScreenRoute,
        page: () => SplashScreen(),
        bindings: [
          SplashScreenBinding(),
        ],
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: getStartScreenRoute,
        page: () => const GetStartScreen(),
        bindings: [
          GetStartScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: homeScreenRoute,
        page: () => const HomeScreen(),
        bindings: [
          HomeScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: logTestScreenRoute,
        page: () => const LogTestScreen(),
        bindings: [
          LogTestScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: logListScreenRoute,
        page: () => const LogListScreen(),
        bindings: [
          LogListScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: logDetailsScreenRoute,
        page: () => const LogDetailsScreen(),
        bindings: [
          LogDetailsScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: settingScreenRoute,
        page: () => const SettingScreen(),
        bindings: [
          SettingScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: activeTestScreenRoute,
        page: () => const ActiveTestScreen(),
        bindings: [
          ActiveTestScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: activeTestDetailsScreenRoute,
        page: () => const ActiveTestDetailScreen(),
        bindings: [
          ActiveTestDetailScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
  ];
}
