import 'package:get/get.dart';

class EcosystemController extends GetxController {
  var ecosystemList = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ].obs;

  void refreshData() {
    // ecosystemList.value = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  }

  void loadMoreData() {
    // ecosystemList.addAll(['Item 6', 'Item 7', 'Item 8', 'Item 9', 'Item 10']);
  }
}
