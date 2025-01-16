import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeListScreen extends StatefulWidget {
  HomeListScreen({Key? key}) : super(key: key);

  @override
  State<HomeListScreen> createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  final storage = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(() {
      if (storage.assetsList.isEmpty) {
        return Center(
          child: Text(
            'NUll Data',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      } else {
        return Column(
            children: storage.assetsList.value.map((item) {
          int index = storage.assetsList.value.indexOf(item);
          return InkWell(
            onTap: () {
              // Get.toNamed(AppPages.assets);
            },
            child: Container(
              width: 343.w,
              height: 56.w,
              margin: EdgeInsets.only(bottom: 8.w),
              padding: EdgeInsets.only(left: 19.w, right: 19.w),
              decoration: BoxDecoration(
                color: Color(0XFF1F0B0E),
                borderRadius: BorderRadius.circular(10.r),
                border: Border(
                    top: BorderSide(width: 2.w, color: Color(0x33FFFFFF))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.network('${item['icon']}',
                          width: 25.w, height: 25.h),
                      Container(
                        margin: EdgeInsets.only(left: 4.w),
                        child: Text(
                          '${item['name']}',
                          style: TextStyle(
                              color: Color(0XFFFFFFFF),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 4.w),
                        child: Text(
                          '${formatNumber(item['amount'], decimalPlaces: 2)}',
                          style: TextStyle(
                              color: Color(0XFFE5B045),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Image.asset(
                        'assets/images/home_list_right.png',
                        width: 16.w,
                        height: 16.w,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList());
      }
    }));
  }
}
