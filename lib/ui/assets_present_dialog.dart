import 'package:airdrop_flutter/controllers/assets_details_controller.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void showCenterPresent(
    {String message = 'test', Map<String, dynamic>? config}) {
  AssetsDetailsController assetsDetailsController =
      Get.put(AssetsDetailsController());
  final storage = Get.find<StorageService>();
  final balance = storage.assetsList.value[0]['amount'] ?? 0;

  // FocusNode 控制焦点，键盘弹出页面滚动
  FocusNode _focusNodeAmount = FocusNode();
  FocusNode _focusNodeTGid = FocusNode();

  TextEditingController _controllerAmount = TextEditingController();
  TextEditingController _controllerTGid = TextEditingController();
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    builder: (_) => Container(
      height: 506.w,
      decoration: BoxDecoration(
          color: Color(0XFFE6EBF2), borderRadius: BorderRadius.circular(30.r)),
      padding: EdgeInsets.only(top: 12.w, left: 16.w, right: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  SmartDialog.dismiss();
                },
                child: Image.asset(
                  'assets/images/assets_dialog_close.png',
                  width: 28.w,
                  height: 28.w,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 0.w),
            child: Image.asset(
              'assets/images/pre_icon.png',
              width: 80.w,
              height: 80.w,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12.w),
            child: Text(
              'ADT',
              style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900),
            ),
          ),
          // input
          Container(
            width: 343.w,
            height: 48.w,
            padding: EdgeInsets.only(left: 12.w, right: 16.w),
            decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(4.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250.w,
                  child: TextField(
                    onChanged: (value) {
                      assetsDetailsController.presentAmount.value = value;
                      AppLogger.instance
                          .d(assetsDetailsController.presentAmount.value);
                    },
                    controller: _controllerAmount,
                    focusNode: _focusNodeAmount,
                    keyboardType: TextInputType.number,
                    cursorColor: const Color(0xFFCC9533),
                    decoration: InputDecoration(
                        hintText: 'Amount',
                        hintStyle: TextStyle(
                            color: Color(0XFFCCCCCC), fontSize: 14.sp),
                        border: InputBorder.none),
                  ),
                ),
                Text(
                  'Max',
                  style: TextStyle(color: Color(0XFFA66B19), fontSize: 14.sp),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w, bottom: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Balance',
                  style: TextStyle(color: Color(0XFF6666666), fontSize: 14.sp),
                ),
                Container(
                  margin: EdgeInsets.only(left: 9.7.w),
                  child: Image.network(
                    '${config?['icon']}',
                    width: 14.5.w,
                    height: 14.5.w,
                  ),
                ),
                Text(
                  '${formatNumber(balance)}',
                  style: TextStyle(color: Color(0XFF000000), fontSize: 14.sp),
                )
              ],
            ),
          ),
          Container(
            width: 343.w,
            height: 48.w,
            padding: EdgeInsets.only(left: 12.w),
            margin: EdgeInsets.only(bottom: 24.w),
            decoration: BoxDecoration(
              color: Color(0XFFFFFFFF),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: TextField(
              onChanged: (value) {
                assetsDetailsController.presentTGid.value = value;
                AppLogger.instance.d(assetsDetailsController.presentTGid.value);
              },
              controller: _controllerTGid,
              focusNode: _focusNodeTGid,
              keyboardType: TextInputType.number,
              cursorColor: const Color(0xFFCC9533),
              decoration: InputDecoration(
                  hintText: 'Enter the user\'s Telegram lD',
                  hintStyle:
                      TextStyle(color: Color(0XFFCCCCCC), fontSize: 14.sp),
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaclion fee',
                  style: TextStyle(color: Color(0XFF000000), fontSize: 14.sp),
                ),
                Row(
                  children: [
                    Image.network(
                      '${config?['icon']}',
                      width: 16.w,
                      height: 16.w,
                    ),
                    Obx(() {
                      return Text(
                        ' ${assetsDetailsController.getFormattedAmount()}',
                        style: TextStyle(
                            color: Color(0XFF000000), fontSize: 14.sp),
                      );
                    })
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              final amount =
                  int.parse(assetsDetailsController.presentAmount.value);
              final id = config?['assetId'].toString();

              if (amount != 0 &&
                  assetsDetailsController.presentTGid.value.length > 0 &&
                  id != null) {
                assetsDetailsController.userGiftTokens(
                    id,
                    assetsDetailsController.presentTGid.value,
                    amount.toString());
              }
            },
            child: Container(
                width: 343.w,
                height: 48.w,
                decoration: BoxDecoration(
                    color: Color(0XFFD99B21),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(width: 1.0, color: Color(0XFF000000))),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border(
                          top: BorderSide(
                              width: 2.0, color: Color(0XFFFEFFD1)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/assets_details_icon.png',
                        width: 24.w,
                        height: 24.w,
                      ),
                      Text(
                        'Giveaway',
                        style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ),
  );
}
