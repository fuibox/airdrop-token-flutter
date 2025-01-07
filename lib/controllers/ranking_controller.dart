import 'package:get/get.dart';

class RankingController extends GetxController {
  var rankingList =
      <String>['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'].obs;

  void refreshData() {
    rankingList.value = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  }

  void loadMoreData() {
    rankingList.addAll(['Item 6', 'Item 7', 'Item 8', 'Item 9', 'Item 10']);
  }
}
