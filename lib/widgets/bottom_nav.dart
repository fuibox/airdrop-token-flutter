import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class BottomNav extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Obx 监听
      return Container(
        padding: EdgeInsets.only(top: 2.h),
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
          // selectedItemColor: Colors.white,
          // unselectedItemColor: Colors.grey,
          // selectedLabelStyle: const TextStyle(
          //     fontWeight: FontWeight.bold, color: Colors.white),
          // unselectedLabelStyle: const TextStyle(
          //     fontWeight: FontWeight.normal, color: Colors.grey),
          selectedFontSize: 0.sp,
          unselectedFontSize: 0.sp,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: 60.w,
                height: 49.h,
                decoration: BoxDecoration(
                  image: homeController.selectedIndex.value == 0
                      ? const DecorationImage(
                          image: AssetImage(
                            'assets/images/tb_bg.png',
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: Image.asset(
                        'assets/images/tb_home.png',
                      ),
                    ),
                    Text('home'.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: homeController.selectedIndex.value == 0
                              ? FontWeight.w900
                              : null,
                          color: homeController.selectedIndex.value == 0
                              ? const Color(0xFFFFDA73)
                              : const Color(0xFFEEEEEE),
                        ))
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 60.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    image: homeController.selectedIndex.value == 1
                        ? const DecorationImage(
                            image: AssetImage(
                              'assets/images/tb_bg.png',
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: Image.asset(
                          'assets/images/tb_earn.png',
                        ),
                      ),
                      Text('earn'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: homeController.selectedIndex.value == 1
                                ? FontWeight.w900
                                : null,
                            color: homeController.selectedIndex.value == 1
                                ? const Color(0xFFFFDA73)
                                : const Color(0xFFEEEEEE),
                          ))
                    ],
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 60.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    image: homeController.selectedIndex.value == 2
                        ? const DecorationImage(
                            image: AssetImage(
                              'assets/images/tb_bg.png',
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: Image.asset(
                          'assets/images/tb_task.png',
                        ),
                      ),
                      Text('tasks'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: homeController.selectedIndex.value == 2
                                ? FontWeight.w900
                                : null,
                            color: homeController.selectedIndex.value == 2
                                ? const Color(0xFFFFDA73)
                                : const Color(0xFFEEEEEE),
                          ))
                    ],
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 60.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    image: homeController.selectedIndex.value == 3
                        ? const DecorationImage(
                            image: AssetImage(
                              'assets/images/tb_bg.png',
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: Image.asset(
                          'assets/images/tb_friend.png',
                        ),
                      ),
                      Text('friends'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: homeController.selectedIndex.value == 3
                                ? FontWeight.w900
                                : null,
                            color: homeController.selectedIndex.value == 3
                                ? const Color(0xFFFFDA73)
                                : const Color(0xFFEEEEEE),
                          ))
                    ],
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 60.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    image: homeController.selectedIndex.value == 4
                        ? const DecorationImage(
                            image: AssetImage(
                              'assets/images/tb_bg.png',
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(8.r), // 设置圆角
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: Image.asset(
                          'assets/images/tb_games.png',
                        ),
                      ),
                      Text('games'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: homeController.selectedIndex.value == 4
                                ? FontWeight.w900
                                : null,
                            color: homeController.selectedIndex.value == 4
                                ? const Color(0xFFFFDA73)
                                : const Color(0xFFEEEEEE),
                          ))
                    ],
                  )),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}
