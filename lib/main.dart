import 'package:cotec/routes/app_routes.dart';
import 'package:cotec/widgets/error_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_export.dart';
import 'core/utils/app_prefs_key.dart';
import 'core/utils/hive_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CommonConstant.instance.dbHelper.initHive();
  ColorConstant();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ErrorWidget.builder =
      (FlutterErrorDetails details) => AppFlutterErrorScreen(details: details);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RxBool _isLightTheme = false.obs;

  _getThemeStatus() async {
    bool isLight =
        CommonConstant.instance.dbHelper.box.get(HiveKey.isDarkMode) ?? true;

    _isLightTheme.value = isLight;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  void initState() {
    _getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cotec',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      // theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splashScreenRoute,
    );
  }
}
