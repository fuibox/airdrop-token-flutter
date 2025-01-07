import 'package:get/get.dart';
import '../service/api_user_service.dart';

class ApiController extends GetxController {
  var isLoading = false.obs; // 控制加载状态
  var errorMessage = ''.obs; // 显示错误信息
  var userData = RxMap<String, dynamic>(); // 用户数据

  // 处理短信登录
  Future<void> loginWithSms(String zone, String phone, String code) async {
    isLoading(true);
    try {
      final response = await userService.loginWithSms(zone, phone, code);
      if (response.statusCode == 200) {
        userData.value = response.data;
      } else {
        errorMessage.value = '登录失败';
      }
    } catch (e) {
      errorMessage.value = '发生错误: $e';
    } finally {
      isLoading(false);
    }
  }
}

final apiController = Get.put(ApiController());
