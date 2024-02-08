import 'package:cotec/routes/app_routes.dart';
import 'package:cotec/widgets/error_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_export.dart';
import 'core/utils/hive_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().initHive();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ErrorWidget.builder =
      (FlutterErrorDetails details) => AppFlutterErrorScreen(details: details);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cotec',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splashScreenRoute,
    );
  }
}
