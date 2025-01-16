import 'package:airdrop_flutter/service/api_tasks_service.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:get/get.dart';

class SocialListController extends GetxController {
  var socialList = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
  ].obs;

  void getTaskListData() async {
    final result = await taskService.UserTaskList();

    AppLogger.instance.d('taskList:${result.data}');
  }

  void loadMoreData() {}
}
