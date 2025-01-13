import 'package:dio/dio.dart';
import "api_service.dart";

class UserService {
  // 发送登录短信验证
  Future<Response> loginWithSms(String zone, String phone, String code) async {
    try {
      final response = await dioService.postRequest(
        'user/send_login_sms',
        {
          'zone': zone,
          'phone': phone,
          'code': code,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 短信验证
  Future<Response> loginVerify(String zone, String phone, String code) async {
    try {
      final response = await dioService.postRequest(
        'user/verify_login_sms',
        {
          'zone': zone,
          'phone': phone,
          'code': code,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 用户信息
  Future<Response> UserInfo() async {
    try {
      final response = await dioService.getRequest('user/info');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 修改用户昵称
  Future<Response> UpdateUserName(String userName) async {
    try {
      Map<String, dynamic> queryParams = {
        'nickName': userName,
      };
      final response = await dioService.getRequest('user/update_nickname',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 获取礼物提示
  Future<Response> UserGifts() async {
    try {
      final response = await dioService.getRequest('user/my_gifts');

      return response;
    } catch (e) {
      rethrow;
    }
  }
}

final userService = UserService();
