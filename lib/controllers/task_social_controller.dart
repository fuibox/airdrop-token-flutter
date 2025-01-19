import 'package:airdrop_flutter/service/api_tasks_service.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:get/get.dart';

class SocialListController extends GetxController {
  final RxList basicList = [].obs;
  final RxList sociaList = [].obs;
  var socialList = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
  ].obs;

  void getTaskListData() async {
    final result = await taskService.UserTaskList();

    List<dynamic> taskList = result.data['data'] ?? [];

    basicList.clear();
    sociaList.clear();
    // 根据 group 分类
    for (var task in taskList) {
      if (task['group'] == 'Basic Tasks') {
        basicList.add(task);
      } else if (task['group'] == 'Social Tasks') {
        sociaList.add(task);
      }
    }

    AppLogger.instance.d('Basic List: ${basicList}');
    AppLogger.instance.d('socia List: ${sociaList}');
  }

  void getTaskAnswer() async {
    final result = await taskService.TaskQuizAnswer('1', '2');

    AppLogger.instance.d('校验:${result.data}');
  }

  void getTaskProgress() async {
    final result = await taskService.TaskQuizProgress();

    AppLogger.instance.d('daily tasks:${result.data}');
  }

  void loadMoreData() {}
}
