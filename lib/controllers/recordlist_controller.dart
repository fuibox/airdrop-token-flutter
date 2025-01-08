import 'package:get/get.dart';

class RecordlistController extends GetxController {
  var recordList =
      <String>['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'].obs;

  void refreshData() {
    recordList.value = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  }

  void loadMoreData() {
    recordList.addAll(['Item 6', 'Item 7', 'Item 8', 'Item 9', 'Item 10']);
  }
}
