import 'package:airdrop_flutter/controllers/recordlist_controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAssetsRecordlistScreen extends StatefulWidget {
  HomeAssetsRecordlistScreen({Key? key}) : super(key: key);

  @override
  State<HomeAssetsRecordlistScreen> createState() =>
      _HomeAssetsRecordlistScreenState();
}

class _HomeAssetsRecordlistScreenState
    extends State<HomeAssetsRecordlistScreen> {
  final RecordlistController controller = Get.put(RecordlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFE6EBF2),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                // nav
                Container(
                  margin: EdgeInsets.only(top: 44.w, bottom: 24.w),
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  height: 44.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          'assets/images/assets_back.png',
                          width: 24.w,
                          height: 24.w,
                        ),
                      ),
                      Container(
                        child: Text(
                          'Records',
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/assets_back.png',
                        width: 24.w,
                        height: 24.w,
                        opacity: const AlwaysStoppedAnimation(0),
                      ),
                    ],
                  ),
                ),

                // list
                Container(
                  height: 600.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: EasyRefresh(
                    header: null,
                    onRefresh: () async {
                      // 下拉刷新
                      controller.refreshData();
                    },
                    onLoad: () async {
                      // 加载更多
                      controller.loadMoreData();
                    },
                    child: Obx(() {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.recordList.length,
                        itemBuilder: (context, index) {
                          // 渲染排名数据
                          return Container(
                            width: 343.w,
                            height: 72.w,
                            margin: EdgeInsets.only(bottom: 8.w),
                            padding: EdgeInsets.only(left: 16.w, right: 16.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Color(0XFFFFFFFF)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.recordList[index],
                                      style: TextStyle(
                                          color: Color(0XFF000000),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '2020.23.11 / 7:23',
                                      style: TextStyle(
                                          color: Color(0XFF999999),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '+210.1232',
                                      style: TextStyle(
                                          color: Color(0XFF000000),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Image.asset(
                                      'assets/images/adt_token.png',
                                      width: 14.55.w,
                                      height: 14.55.w,
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
