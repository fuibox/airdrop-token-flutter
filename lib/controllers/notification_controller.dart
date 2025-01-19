import 'package:airdrop_flutter/service/api_user_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:get/get.dart';
import 'dart:async';

class NotificationController extends GetxController {
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs; // 保存完整数据
  RxList<Map<String, dynamic>> displayedItems =
      <Map<String, dynamic>>[].obs; // 同步显示完整数据
  Timer? _scrollTimer;
  final storage = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
    _startAutoScroll();
  }

  void fetchItems() async {
    try {
      final response = await userService.UserWinnerCarousel();

      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data is List) {
          final fetchedItems = data.cast<Map<String, dynamic>>();
          items.assignAll(fetchedItems);
          displayedItems.assignAll(fetchedItems); // 同步显示数据

          // 打印成功日志
          print('数据获取成功，共 ${fetchedItems.length} 条记录');
        } else {
          print('e: $data');
        }
      } else {
        print('数据获取失败，状态码: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('获取数据时出错: $e');
      print('堆栈信息: $stackTrace');
    }
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      // _rotateItems();
    });
  }

  // void _rotateItems() {
  //   if (items.isNotEmpty) {
  //     var firstItem = items.removeAt(0);
  //     items.add(firstItem);
  //     displayedItems.value = List.from(items); // 更新 displayedItems 来触发 UI 刷新
  //   }
  // }

  void addItem(item) {
    items.add(item);
  }

  void removeItem(String item) {
    items.remove(item);
  }

  void clearItems() {
    items.clear();
  }

  @override
  void onClose() {
    _scrollTimer?.cancel();
    super.onClose();
  }
}
