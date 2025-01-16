import 'package:airdrop_flutter/service/api_user_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:get/get.dart';
import 'dart:async';

class NotificationController extends GetxController {
  RxList<dynamic> items = <dynamic>[].obs;
  RxList<String> displayedItems = <String>[].obs;
  Timer? _scrollTimer;
  final storage = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
    _startAutoScroll();
  }

  // 获取用户奖品数据
  void fetchItems() async {
    try {
      final response = await userService.UserWinnerCarousel();

      if (response.statusCode == 200) {
        List<dynamic> fetchedItems = List.from(response.data['data']);
        storage.userWinner.value = fetchedItems;
        items.assignAll(fetchedItems);
        displayedItems.value = List.from(items);
      } else {
        print('数据获取失败');
      }
    } catch (e) {
      print('获取数据时出错: $e');
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

  void addItem(String item) {
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
