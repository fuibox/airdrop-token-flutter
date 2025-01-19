import 'package:airdrop_flutter/service/api_earn_service.dart';
import 'package:airdrop_flutter/service/api_tasks_service.dart';
import 'package:airdrop_flutter/service/api_user_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/ui/task_correct.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class TaskAnswerController extends GetxController {
  // 答题总列表
  var taskAnswerList = [].obs;

  // 总题目数
  RxInt taskLength = 0.obs;

  // 总答题状态
  RxBool finished = false.obs;

  // 当前题目索引
  RxInt currentQuestionIndex = 0.obs;

  // 当前题目数据
  RxList questionData = [].obs;

  // 当前题目question
  RxString question = ''.obs;

  // 当前答题状态 (0: 默认, 1 正确, -1 错误)
  RxList<int> answerStates = <int>[0, 0, 0, 0].obs;
  // 正确答案
  var correctAnswer = 0.obs;

  // 当前答题id
  RxInt answerId = 0.obs;

  // 初始化控制器
  @override
  void onInit() {
    super.onInit();
    getTaskProgress(); // 初始化时加载答题进度
  }

  /// 校验问题答案
  Future<void> validateAnswer() async {
    try {
      final result = await taskService.TaskQuizAnswer(
          answerId.toString(), correctAnswer.toString());

      if (result.data['code'] == 200) {
        AppLogger.instance.d('校验成功: ${result.data}');
        goToNextQuestion();
      } else {
        AppLogger.instance.d('校验失败: ${result.data['message']}');
      }
    } catch (e) {
      AppLogger.instance.e('校验出错: $e');
    }
  }

  /// 获取答题进度
  Future<void> getTaskProgress() async {
    try {
      final result = await taskService.TaskQuizProgress();
      if (result.data['code'] == 200 && result.data != null) {
        AppLogger.instance.d('答题列表: ${result.data}');

        // 初始化题目数据
        taskAnswerList.value = result.data['data']['remainQuestions'];
        taskLength.value = result.data['data']['questionTotalNum'];
        finished.value = result.data['data']['finished'];
        questionData.value =
            taskAnswerList.value[currentQuestionIndex.value]['options'];
        question.value =
            taskAnswerList.value[currentQuestionIndex.value]['question'];
        correctAnswer.value =
            taskAnswerList.value[currentQuestionIndex.value]['answer'];
        answerId.value = taskAnswerList.value[currentQuestionIndex.value]['id'];

        AppLogger.instance.e('总题库: $taskAnswerList');
        AppLogger.instance.e('当前题库 $questionData');
      }
    } catch (e) {
      AppLogger.instance.e('获取答题进度出错: $e');
    }
  }

  /// 更新选项的答题状态
  void updateAnswerState(int selectedAnswerIndex) {
    if (selectedAnswerIndex == correctAnswer.value) {
      answerStates[selectedAnswerIndex] = 1; // 1 表示正确
    } else {
      answerStates[selectedAnswerIndex] = -1; // -1 表示错误
    }
  }

  /// 重置答题状态
  void resetAnswerStates() {
    answerStates.value = List.filled(questionData.length, 0); // 重置为默认状态
  }

  /// 切换到下一题
  Future<void> goToNextQuestion() async {
    if (currentQuestionIndex.value < taskAnswerList.length - 1) {
      currentQuestionIndex.value++;
      questionData.value =
          taskAnswerList.value[currentQuestionIndex.value]['options'];
      question.value =
          taskAnswerList.value[currentQuestionIndex.value]['question'];
      correctAnswer.value =
          taskAnswerList.value[currentQuestionIndex.value]['answer'];
      answerId.value = taskAnswerList.value[currentQuestionIndex.value]['id'];

      resetAnswerStates();
    } else {
      // 显示完成弹窗
      SmartDialog.dismiss();
      showBottomCorrect();
      // 更新userinfo
      final result = await userService.UserInfo();
      // 更新用户抽奖次数
      final result1 = await earnService.EarnLotteryInfo();

      final storage = Get.find<StorageService>();
      storage.updateUserInfo(result.data['data'] as Map<String, dynamic>);
      storage.updateUserLottery(result1.data['data'] as Map<String, dynamic>);
    }
  }

  /// 获取游戏任务进度
  Future<void> getGamesTaskProgress() async {
    try {
      final result = await taskService.UserTaskGameProgress();
      AppLogger.instance.d('游戏进度: ${result.data}');
      // 处理游戏任务逻辑
    } catch (e) {
      AppLogger.instance.e('获取游戏任务进度出错: $e');
    }
  }
}
