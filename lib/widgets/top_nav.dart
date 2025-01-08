import 'package:airdrop_flutter/controllers/notification_controller.dart';
import 'package:airdrop_flutter/routes/app_pages.dart';
import 'package:airdrop_flutter/ui/global_notifiication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/logger.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final NotificationController notificationController = Get.find();

  TopNav({Key? key})
      : preferredSize = Size.fromHeight(102.w),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 102.w,
      title: Container(
        child: Column(
          children: [
            Container(
              height: 44.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 32.w,
                    width: 32.w,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 0.w, right: 0.w),
                          width: 110.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: Color(0X33FFFFFF),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, right: 0.w),
                                child: Image.asset(
                                  'assets/images/ic_lang.png',
                                  width: 18.w,
                                  height: 18.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 8.w),
                                child: Text(
                                  'English',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, right: 0.w),
                                child: Image.asset(
                                  'assets/images/ld_sele.png',
                                  width: 14.w,
                                  height: 14.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          width: 60.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: Color(0X33FFFFFF),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 0.w, right: 3.8.w),
                                child: Image.asset(
                                  'assets/images/nav_chest.png',
                                  width: 22.w,
                                  height: 22.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.w),
                                child: Text(
                                  '32',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppLogger.instance.d('login');
                          Get.toNamed(AppPages.login);
                        },
                        child: Container(
                          width: 72.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFCC9533),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'login'.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // notifiication
            Container(
              child: LoopScrollWidget(
                items: [
                  [for (var item in notificationController.items) item],
                ],
                itemBuilder: (context, rowIndex, index) {
                  return Container(
                      width: 217.w,
                      height: 22.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                          color: Color(0X33FFFFFF),
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            notificationController.items[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0X66FFFFFF),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      elevation: 0,
    );
  }
}
