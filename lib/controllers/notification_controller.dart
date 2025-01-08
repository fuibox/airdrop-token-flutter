import 'package:get/get.dart';
import 'dart:async';

class NotificationController extends GetxController {
  RxList<String> items = <String>[
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
  ].obs;

  RxList<String> displayedItems = <String>[].obs;
  Timer? _scrollTimer;

  @override
  void onInit() {
    super.onInit();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      _rotateItems();
    });
  }

  void _rotateItems() {
    var firstItem = items.removeAt(0);
    items.add(firstItem);
    displayedItems.value = List.from(items);
  }

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
