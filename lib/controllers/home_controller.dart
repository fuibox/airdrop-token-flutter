import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  // 当前选中的 tab 索引
  Rx<int> selectedIndex = 0.obs; // 默认选中第一个 tab

  // 滚动控制器
  RxList<String> items = <String>[
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
    '0xfd283… minted AirDrop Coins NFT',
  ].obs;

  RxDouble offsetX = 0.0.obs; // 控制滚动的X偏移量
  RxDouble speed = 1000.0.obs; // 滚动的速度
  late Timer _timer; // 定时器

  // 开始滚动的逻辑r
  void startScrolling() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (offsetX.value > 1000) {
        offsetX.value = -100.0; // 循环效果
      } else {
        offsetX.value += speed.value; // 按照设定的速度
      }
    });
  }

  // 停止滚动
  void stopScrolling() {
    _timer.cancel(); // 停止定时器
  }
}
