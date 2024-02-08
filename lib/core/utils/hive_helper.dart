import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../app_export.dart';

class DbHelper {
  late Box<dynamic> box; // Specify the type of the box
  late Box<dynamic> prefBox; // Specify the type of the box

  Future<void> initHive() async {
    final document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    box = await Hive.openBox('USER_BOX');
    prefBox = await Hive.openBox('ADMIN_BOX');
  }
}
