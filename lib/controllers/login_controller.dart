import 'package:get/get.dart';
import 'dart:async';

class LoginController extends GetxController {
  // 手机号和验证码的控制器
  var phoneNumber = ''.obs;
  var otp = ''.obs;

  //默认区号
  var areaCode = '+1'.obs;

  // 获取验证码倒计时状态
  var _countdown = 60.obs;
  var _isButtonEnabled = true.obs;

  int get countdown => _countdown.value;
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

  // 提交登录
  void submitLogin() {
    print('手机号: ${phoneNumber.value}');
    print('验证码: ${otp.value}');
  }
}
