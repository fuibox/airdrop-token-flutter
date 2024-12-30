import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class BottomNav extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Obx 监听
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0x1AFFFFFF),
              width: 1.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF000000),
          currentIndex: homeController.selectedIndex.value,
          onTap: (index) {
            homeController.selectedIndex.value = index;
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.earbuds),
              label: 'Earn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fire_extinguisher),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gamepad),
              label: 'Games',
            ),
          ],
        ),
      );
    });
  }
}
