import 'package:get/get.dart';

class HomeController extends GetxController {
  // 创建一个响应式变量来保存当前选中的 tab 索引
  Rx<int> selectedIndex = 0.obs; // 默认选中第一个 tab
}
