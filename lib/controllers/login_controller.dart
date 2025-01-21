import 'package:airdrop_flutter/controllers/notification_controller.dart';
import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/service/api_earn_service.dart';
import 'package:airdrop_flutter/service/api_user_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:get/get.dart';
import 'dart:async';

class LoginController extends GetxController {
  // 手机号
  var phoneNumber = ''.obs;
  // 验证码
  var otp = ''.obs;

  //区号
  var areaCode = '+1'.obs;

  // token

  var token = ''.obs;

  // 表示登录是否成功
  var isLoginSuccess = false.obs;
  // 存储登录相关的错误信息
  var loginError = ''.obs;

  // 获取验证码倒计时状态
  var _countdown = 60.obs;
  var _isButtonEnabled = true.obs;

  int get countdown => _countdown.value;
  // 按钮是否可用
  bool get isButtonEnabled => _isButtonEnabled.value;

  // 获取验证码倒计时逻辑
  void startCountdown() {
    if (_countdown.value == 60) {
      _isButtonEnabled.value = false;
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (_countdown.value == 0) {
          _isButtonEnabled.value = true;
          _countdown.value = 60;
          timer.cancel();
        } else {
          _countdown.value--;
        }
      });
    }
  }

  // 设置手机号
  void setPhoneNumber(String number) {
    phoneNumber.value = number;
  }

  // 设置验证码
  void setOtp(String otpCode) {
    otp.value = otpCode;
  }

  // 短信验证码
  Future<void> sendSmsCode() async {
    try {
      if (phoneNumber.value.isEmpty) {
        loginError.value = '请输入手机号码';
        return;
      }
      final response = await userService.loginWithSms(
          areaCode.value, phoneNumber.value, otp.value);
      if (response.statusCode == 200) {
        startCountdown();
      } else {
        loginError.value = '发送短信验证码失败，请稍后重试';
      }
    } catch (e) {
      loginError.value = '网络异常，请检查网络连接';
      print('发送短信验证码出现异常：$e');
    }
  }

  // 登录
  Future<void> submitLogin() async {
    try {
      if (phoneNumber.value.isEmpty || otp.value.isEmpty) {
        loginError.value = '请输入完整的手机号码和验证码';
        return;
      }
      final verifyResponse = await userService.loginVerify(
          areaCode.value, phoneNumber.value, otp.value);
      if (verifyResponse.statusCode == 200) {
        // 登录成功，更新登录成功状态
        isLoginSuccess.value = true;
        isLoginSuccess.refresh(); // 通知界面更新
        final storage = Get.find<StorageService>();
        storage.isLoggedIn.value = true;

        if (verifyResponse.data != null &&
            verifyResponse.data['data'] != null &&
            verifyResponse.data['data']['token'] != null) {
          token.value = verifyResponse.data['data']['token'];
          storage.token.value = verifyResponse.data['data']['token'];
          UserConfig();
          Get.back();
        }
      } else {
        loginError.value = '登录验证失败，请检查手机号码和验证码是否正确';
      }
    } catch (e) {
      loginError.value = '登录出现异常，请稍后重试';
      print('登录出现异常：$e');
    }
  }

  Future<void> UserConfig() async {
    final NotificationController notificationController =
        Get.put(NotificationController());

    notificationController.fetchItems();

    try {
      // 并行请求其他接口
      final results = await Future.wait([
        userService.UserInfo(), // 用户信息
        userAssetsService.AssetsProzePoolList(), // 奖金池
        userAssetsService.UserAssetList(), // 资产列表
        userAssetsService.AssetsMyRank(), //我的资产排名
        earnService.EarnLotteryInfo(), // 抽奖余额
      ]);

      // 分别处理返回值
      final userInfo = results[0].data;
      final prozePool = results[1].data;
      final userAssetsList = results[2].data;
      final userRank = results[3].data;
      final userLottery = results[4].data;

      // 保存数据到本地或状态管理
      final storage = Get.find<StorageService>();

      storage.userInfo.value = userInfo['data'] as Map<String, dynamic>;
      storage.prizePool.value = prozePool['data'] as Map<String, dynamic>;
      storage.assetsList.value = userAssetsList['data'] as List;
      storage.userRank.value = userRank['data'] as Map<String, dynamic>;
      storage.userLottery.value = userLottery['data'] as Map<String, dynamic>;

      AppLogger.instance.d('userinfo:${storage.userInfo.value}');
      AppLogger.instance.d('prize:${storage.prizePool.value}');
      AppLogger.instance.d('assets:${storage.assetsList.value[0]['amount']}');
      AppLogger.instance.d('rank:${storage.userRank.value}');
      AppLogger.instance
          .d('userlotteryinfo:${storage.userLottery.value['opportunity']}');
    } catch (e) {
      Get.snackbar('Error', '请求失败，请重试');
    } finally {}
  }
}
