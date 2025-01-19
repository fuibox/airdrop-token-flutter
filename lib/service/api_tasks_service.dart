import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "api_service.dart";

class TaskService {
  // 获取任务列表
  Future<Response> UserTaskList() async {
    try {
      final response = await dioService.getRequest('task/task_list');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 获取任务进度
  Future<Response> UserTaskProgress(String taskIds) async {
    try {
      Map<String, dynamic> queryParams = {'taskIds': taskIds};
      final response = await dioService.getRequest('task/progress_list',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 完成任务follow_twitter 关注推特
  Future<Response> UserTaskShareTwitter(String taskId) async {
    try {
      Map<String, dynamic> queryParams = {'taskId': taskId};
      final response = await dioService.getRequest('task//follow_twitter',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 完成任务share_twitter 分享推特
  Future<Response> UserTaskShareTW(String taskId) async {
    try {
      Map<String, dynamic> queryParams = {'taskId': taskId};
      final response = await dioService.getRequest('task/share_twitter',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 完成任务like_comment_twitter 推特点赞评论
  Future<Response> UserTaskLikeTwiiter(String taskId) async {
    try {
      Map<String, dynamic> queryParams = {'taskId': taskId};
      final response = await dioService.getRequest('task/like_comment_twitter',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 完成任务join_tg_group 加入tg群组
  Future<Response> UserTaskJoinTG(String taskId) async {
    try {
      Map<String, dynamic> queryParams = {'taskId': taskId};
      final response = await dioService.getRequest('task/join_tg_group',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 查看游戏任务进度
  Future<Response> UserTaskGameProgress() async {
    try {
      final response = await dioService.getRequest('task/game_progress_list');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /**
   *  答题
   */

  // 获取我的答题进度
  Future<Response> TaskQuizProgress() async {
    try {
      final response = await dioService.getRequest('quiz/progress');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 回答问题
  Future<Response> TaskQuizAnswer(String questionId, String answerIndex) async {
    try {
      Map<String, dynamic> queryParams = {
        'questionId': questionId,
        'answerIndex': answerIndex
      };
      final response =
          await dioService.getRequest('quiz/answer', queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

final taskService = TaskService();
