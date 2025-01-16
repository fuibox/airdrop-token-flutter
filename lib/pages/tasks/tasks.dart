import 'package:airdrop_flutter/controllers/task_social_controller.dart';
import 'package:airdrop_flutter/pages/tasks/social_tasks.dart';
import 'package:airdrop_flutter/pages/tasks/web3_tasks.dart';
import 'package:airdrop_flutter/ui/task_answer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final SocialListController taskController = Get.put((SocialListController()));

  @override
  void initState() {
    super.initState();
    taskController.getTaskListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Daily tasks
            Container(
              margin: EdgeInsets.only(left: 16.w, bottom: 12.w),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    child: Image.asset(
                      'assets/images/task_daily_nav_icon.png',
                      width: 18.w,
                      height: 18.w,
                    ),
                  ),
                  Text(
                    'Daily Tasks',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              width: 343.w,
              height: 136.w,
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/task_bg.png',
                    ),
                    fit: BoxFit.contain),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: Image.asset(
                          'assets/images/icon_task.png',
                          width: 44.w,
                          height: 44.w,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 0.w),
                            width: 258.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quiz Tasks',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/nav_chest.png',
                                      width: 20.w,
                                      height: 20.w,
                                    ),
                                    Text(
                                      '+5',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 258.w,
                            child: Wrap(
                              children: [
                                Text(
                                  'There are 3 questions every day, and you will get an airdrop box for each correct answer.',
                                  style: TextStyle(
                                      color:
                                          Color(0XFFFFFFFF).withOpacity(0.65),
                                      fontSize: 12.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showBottomAnswer();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 12.w),
                          width: 311.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Color(0XFFCED3D9)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border(
                                    top: BorderSide(
                                        width: 2.w,
                                        color:
                                            Color(0XFFFFFFFF).withOpacity(1)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Participate Now',
                                  style: TextStyle(
                                      color: Color(0XFF616973),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 343.w,
              height: 302.w,
              margin: EdgeInsets.only(top: 12.w, bottom: 32.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                gradient: const LinearGradient(
                  colors: [Color(0XFF3D3640), Color(0XFF4D3D26)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border(
                        top: BorderSide(
                            width: 2.w,
                            color: Color(0XFFFFFFFF).withOpacity(0.25)))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16.w, bottom: 8.w),
                      padding: EdgeInsets.only(left: 12.w),
                      width: 311.w,
                      height: 66.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Color(0XFF000000).withOpacity(0.2),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/task_daily_icon3.png',
                            width: 28.w,
                            height: 28.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4.68.w, right: 9.w),
                            width: 194.w,
                            child: Text(
                              'Participate in "Win Big Prize" once.',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 14.sp,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/nav_chest.png',
                                width: 20.w,
                                height: 20.w,
                              ),
                              Text(
                                '+1',
                                style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Figtree'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.w, bottom: 8.w),
                      padding: EdgeInsets.only(left: 12.w),
                      width: 311.w,
                      height: 66.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Color(0XFF000000).withOpacity(0.2),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/task_daily_icon1.png',
                            width: 28.w,
                            height: 28.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4.68.w, right: 9.w),
                            width: 194.w,
                            child: Text(
                              'Participate in Ultimate Escape and bet 0/200 ADT',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 14.sp,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/gcc_token.png',
                                width: 20.w,
                                height: 20.w,
                              ),
                              Text(
                                '+0.1',
                                style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Figtree'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.w, bottom: 8.w),
                      padding: EdgeInsets.only(left: 12.w),
                      width: 311.w,
                      height: 66.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Color(0XFF000000).withOpacity(0.2),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/task_daily_icon2.png',
                            width: 28.w,
                            height: 28.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4.68.w, right: 9.w),
                            width: 194.w,
                            child: Text(
                              'Participate in Golden Treasure and bet 0/100 ADT',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 14.sp,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/gcc_token.png',
                                width: 20.w,
                                height: 20.w,
                              ),
                              Text(
                                '+0.1',
                                style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Figtree'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 8.w),
                        width: 311.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Color(0XFFD99B21)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border(
                                  top: BorderSide(
                                      width: 2.w,
                                      color: Color(0XFFFEFFD1)
                                          .withOpacity(0.65)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Participate Now',
                                style: TextStyle(
                                    color: Color(0XFF000000),
                                    fontSize: 14.sp,
                                    fontFamily: 'Figtree',
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Web3 tasks
            Web3TasksScreen(),
            // social tasks
            SocialTasksScreen(),
          ],
        ),
      ),
    );
  }
}
