import 'package:airdrop_flutter/controllers/task_basic_contraller.dart';
import 'package:airdrop_flutter/controllers/task_social_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialTasksScreen extends StatefulWidget {
  SocialTasksScreen({Key? key}) : super(key: key);

  @override
  State<SocialTasksScreen> createState() => _SocialTasksScreenState();
}

class _SocialTasksScreenState extends State<SocialTasksScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ScrollController sc = ScrollController();
  final SocialListController controller = Get.put(SocialListController());
  final BasicListController basicController = Get.put(BasicListController());
  final SocialListController taskController = Get.put((SocialListController()));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 410.w,
      margin: EdgeInsets.only(bottom: 59.w),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            dividerHeight: 0,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Figtree",
              fontSize: 16.sp,
            ),
            unselectedLabelStyle: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 0.6),
              fontWeight: FontWeight.w500,
              fontFamily: "Figtree",
              fontSize: 16.sp,
            ),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color.fromRGBO(229, 176, 69, 1),
                  width: 4.w,
                ),
              ),
            ),
            tabs: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/task_soc_nav_icon1.png',
                    width: 18.w,
                    height: 18.w,
                  ),
                  Tab(
                    text: ' Social Tasks(10)',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/task_soc_nav_icon2.png',
                    width: 18.w,
                    height: 18.w,
                  ),
                  Tab(
                    text: ' Basic Tasks(3)',
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Obx(() {
                  if (taskController.sociaList?.isNotEmpty ?? false) {
                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: 12.w),
                        width: 343.w,
                        // height: 254.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          gradient: LinearGradient(
                            colors: [Color(0XFF3d3640), Color(0XFF4d3d26)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 20.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border(
                                  top: BorderSide(
                                      width: 2.w,
                                      color: Color(0xffffffff)
                                          .withOpacity(0.25)))),
                          child: Column(
                            children: taskController.basicList.map((item) {
                              int index =
                                  taskController.basicList.indexOf(item);
                              String imagePath = taskController.basicList[index]
                                      ['image'] ??
                                  'assets/images/task_social_icon1.png';

                              return Container(
                                padding: EdgeInsets.only(left: 12.w),
                                width: 311.w,
                                height: 66.w,
                                margin: EdgeInsets.only(bottom: 8.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xff000000).withOpacity(0.2)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8.w),
                                      child: Image.network(
                                        '${imagePath}',
                                        width: 40.w,
                                        height: 40.w,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20.w),
                                      width: 199.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${taskController.basicList[index]['content']}',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontFamily: 'Figtree',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12.sp),
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/nav_chest.png',
                                                width: 22.w,
                                                height: 22.w,
                                              ),
                                              Text(
                                                '+${taskController.basicList[index]['rewardAmount']}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontFamily: 'D-Din-PRO',
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/task_sele.png',
                                      width: 20.w,
                                      height: 20.w,
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
                Obx(() {
                  if (taskController.sociaList?.isNotEmpty ?? false) {
                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: 12.w),
                        width: 343.w,
                        // height: 254.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          gradient: LinearGradient(
                            colors: [Color(0XFF3d3640), Color(0XFF4d3d26)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 20.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border(
                                  top: BorderSide(
                                      width: 2.w,
                                      color: Color(0xffffffff)
                                          .withOpacity(0.25)))),
                          child: Column(
                            children: taskController.sociaList.map((item) {
                              int index =
                                  taskController.sociaList.indexOf(item);
                              String imagePath = taskController.sociaList[index]
                                      ['image'] ??
                                  'assets/images/task_social_icon1.png';
                              return Container(
                                padding: EdgeInsets.only(left: 12.w),
                                width: 311.w,
                                height: 66.w,
                                margin: EdgeInsets.only(bottom: 8.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0xff000000).withOpacity(0.2)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8.w),
                                      child: Image.network(
                                        '${imagePath}',
                                        width: 40.w,
                                        height: 40.w,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20.w),
                                      width: 199.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${taskController.sociaList[index]['content']}',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontFamily: 'Figtree',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12.sp),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/nav_chest.png',
                                                width: 22.w,
                                                height: 22.w,
                                              ),
                                              Text(
                                                '+${taskController.sociaList[index]['rewardAmount']}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontFamily: 'D-Din-PRO',
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/task_sele.png',
                                      width: 20.w,
                                      height: 20.w,
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
