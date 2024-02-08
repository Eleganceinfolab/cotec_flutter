import 'dart:async';
import 'dart:ffi';

import 'package:cotec/core/app_export.dart';

class LogListScreenController extends GetxController {
  RxList<Item> itemLists = <Item>[].obs;
  RxList<Item> selectedList = <Item>[].obs;
  RxList<Item> searchList = <Item>[].obs;
  RxInt changeQuantity = 1.obs;
  RxBool isSelected = false.obs;

  @override
  void onInit() {
    loadList();

    super.onInit();
  }

  void filterSearchResults(String query) {
    searchList.value = itemLists.value
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  loadList() {
    selectedList.value = [];
    itemLists.value = [
      Item('Jhon Smith', '05/10/2023 at 06:56 PM',
          'Isolation Pre-Test - Energised'),
      Item('Malvin Smith', '06/10/2023 at 07:56 PM', 'Isolation - Dead Test'),
      Item('Kjon tom', '07/10/2023 at 08:56 PM', 'Test Before Touch'),
      Item('Alia wom', '10/10/2023 at 09:56 PM', 'Reinstate Live - Energised'),
    ];
    searchList.value = itemLists.value;
  }
}

class Item {
  String name;
  String date;
  String type;
  Item(this.name, this.date, this.type);
}
