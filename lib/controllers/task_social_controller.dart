import 'package:airdrop_flutter/service/api_earn_service.dart';
import 'package:airdrop_flutter/service/api_tasks_service.dart';
import 'package:airdrop_flutter/service/api_user_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialListController extends GetxController {
  final RxList basicList = [].obs;
  final RxList sociaList = [].obs;

  void getTaskListData() async {
    final result = await taskService.UserTaskList();
    final result1 = await taskService.UserTaskProgress();

    List<dynamic> taskList = result.data['data'] ?? [];
    List<dynamic> progressList = result1.data['data'] ?? [];

    basicList.clear();
    sociaList.clear();
    // 更新任务列表的 finished 字段并根据 group 分类
    for (var task in taskList) {
      for (var progress in progressList) {
        if (task['id'] == progress['taskId']) {
          task['finished'] = progress['finished'];
          break;
        }
      }

      // 分类到对应的列表
      if (task['group'] == 'Basic Tasks') {
        basicList.add(task);
      } else if (task['group'] == 'Social Tasks') {
        sociaList.add(task);
      }
    }

    AppLogger.instance.d('Basic List: ${basicList}');
    AppLogger.instance.d('socia List: ${sociaList}');
  }

  void doTask(
    String type,
    String action,
    String taskId,
  ) async {
    // type 判断任务类型
    // 关注推特
    // 分享推特
    // 加入tg群组
    // 完成任务点赞评论
    final bool urlOpened = await launchUrl(Uri.parse(action));

    if (!urlOpened) {
      AppLogger.instance.d('打开失败');
      return;
    }

    if (type == 'follow_twitter') {
      final response = await taskService.UserTaskShareTwitter(taskId);
      print(response.data.hashCode);

      if (response.data['code'] == 200) {
        getTaskListData();
      }
    } else if (type == 'share_twitter') {
      final response = await taskService.UserTaskShareTW(taskId);
      print(response.data.hashCode);

      if (response.data['code'] == 200) {
        getTaskListData();
      }
    } else if (type == 'join_tg_group') {
      final response = await taskService.UserTaskJoinTG(taskId);
      print(response.data.hashCode);

      if (response.data['code'] == 200) {
        getTaskListData();
      }
    } else if (type == 'like_comment_twitter') {
      final response = await taskService.UserTaskLikeTwiiter(taskId);
      print(response.data.hashCode);

      if (response.data['code'] == 200) {
        getTaskListData();
      }
    }
    // 更新userinfo
    final result = await userService.UserInfo();
    // 更新用户抽奖次数
    final result1 = await earnService.EarnLotteryInfo();

    final storage = Get.find<StorageService>();
    storage.updateUserInfo(result.data['data'] as Map<String, dynamic>);
    storage.updateUserLottery(result1.data['data'] as Map<String, dynamic>);
  }
}
