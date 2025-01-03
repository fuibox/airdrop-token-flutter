import 'package:airdrop_flutter/pages/home/home_assets_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/top_nav.dart';
import '../earn/earn.dart';
import '../tasks/tasks.dart';
import '../friends/friends.dart';
import '../games/games.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNav(), // 顶部导航栏
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return HomeAssetsCardScreen();
          case 1:
            return EarnScreen();
          case 2:
            return TasksScreen();
          case 3:
            return FriendsScreen();
          case 4:
            return GamesScreen();

          default:
            return HomeAssetsCardScreen();
        }
      }),
      bottomNavigationBar: BottomNav(), // 底部导航栏
    );
  }
}
