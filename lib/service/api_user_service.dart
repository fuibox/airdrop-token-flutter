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

  // // 礼物提示
  // Future<Response> Usergifts()
}

final userService = UserService();
