import 'package:airdrop_flutter/controllers/assets_details_controller.dart';
import 'package:airdrop_flutter/controllers/recordlist_controller.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeAssetsRecordlistScreen extends StatefulWidget {
  HomeAssetsRecordlistScreen({Key? key}) : super(key: key);

  @override
  State<HomeAssetsRecordlistScreen> createState() =>
      _HomeAssetsRecordlistScreenState();
}

class _HomeAssetsRecordlistScreenState
    extends State<HomeAssetsRecordlistScreen> {
  final String assetId = Get.arguments ?? '';

  final RecordlistController controller = Get.put(RecordlistController());
  AssetsDetailsController assetsDetailsController =
      Get.put(AssetsDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsDetailsController.getBillsList(assetId);
  }

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
                      // controller.refreshData();
                    },
                    onLoad: () async {
                      // 加载更多
                      // controller.loadMoreData();
                    },
                    child: Obx(() {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount:
                            assetsDetailsController.billsList.value.length,
                        itemBuilder: (context, index) {
                          final item =
                              assetsDetailsController.billsList.value[index];

                          DateTime date = DateTime.fromMillisecondsSinceEpoch(
                              item['timestamp']);

                          String formattedDate =
                              DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
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
                                      item['type'].toString(),
                                      style: TextStyle(
                                          color: Color(0XFF000000),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${formattedDate}',
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
                                      '${formatNumber(item['amount'], decimalPlaces: 4)} ',
                                      style: TextStyle(
                                          color: item['amount']
                                                  .toString()
                                                  .contains('-')
                                              ? Colors.red
                                              : Colors.green,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Image.network(
                                      '${item['icon']}',
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
