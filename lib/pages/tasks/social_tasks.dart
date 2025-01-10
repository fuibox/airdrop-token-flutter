import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialTasksScreen extends StatefulWidget {
  SocialTasksScreen({Key? key}) : super(key: key);

  @override
  State<SocialTasksScreen> createState() => _SocialTasksScreenState();
}

class _SocialTasksScreenState extends State<SocialTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 360.w,
      child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffffffff).withOpacity(0))),
                  // color: Colors.white,
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.transparent, // 设置为透明
                    ), // 设置空的 indicator 以移除下划线
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: [Text('test1'), Text('test2')],
                  )),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    width: 343.w,
                    height: 254.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: const LinearGradient(
                        colors: [Color(0XFF3d3640), Color(0XFF4d3d26)],
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
                                  color: Color(0xffffffff).withOpacity(0.25)))),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                  Container(
                    width: 343.w,
                    height: 254.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: const LinearGradient(
                        colors: [Color(0XFF3d3640), Color(0XFF4d3d26)],
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
                                  color: Color(0xffffffff).withOpacity(0.25)))),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
