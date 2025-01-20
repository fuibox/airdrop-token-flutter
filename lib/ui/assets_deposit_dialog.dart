import 'package:airdrop_flutter/controllers/assets_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showBottomDeposit({String message = 'test'}) {
  AssetsDetailsController assetsDetailsController =
      Get.put(AssetsDetailsController());
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    builder: (_) => Container(
      decoration: BoxDecoration(
          color: Color(0XFFE6EBF2), borderRadius: BorderRadius.circular(30.r)),
      height: 594.w,
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //nav
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/assets_dialog_close.png',
                width: 28.w,
                height: 28.w,
                color: Colors.black.withOpacity(0),
                colorBlendMode: BlendMode.dstATop,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Text(
                  'Deposit',
                  style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
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

          //qrcode
          Container(
            margin: EdgeInsets.only(top: 36.w, bottom: 40.w),
            decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(8.r)),
            width: 180.w,
            height: 180.w,
            child: QrImageView(
              data: '${assetsDetailsController.depositData['address']}',
              version: QrVersions.auto,
              size: 164.w,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Mainnet',
                style: TextStyle(color: Color(0XFF797272), fontSize: 12.sp),
              )
            ],
          ),
          Container(
            width: 343.w,
            height: 48.w,
            margin: EdgeInsets.only(top: 8.w, bottom: 16.w),
            padding: EdgeInsets.only(left: 12.w, right: 16.w),
            decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(4.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${assetsDetailsController.depositData['chainName']}',
                  style: TextStyle(color: Color(0XFF000000), fontSize: 14.sp),
                ),
                Image.asset(
                  'assets/images/switch_icon.png',
                  width: 16.w,
                  height: 16.w,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Deposit address',
                style: TextStyle(color: Color(0XFF797272), fontSize: 12.sp),
              )
            ],
          ),
          Container(
            width: 343.w,
            height: 48.w,
            margin: EdgeInsets.only(top: 8.w, bottom: 36.w),
            padding: EdgeInsets.only(left: 12.w, right: 16.w),
            decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(4.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 290.w,
                  child: Text(
                    '${assetsDetailsController.depositData['address']}',
                    style: TextStyle(color: Color(0XFF000000), fontSize: 14.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                        text: assetsDetailsController.depositData['address']));
                    SmartDialog.showToast('Copy SUCCESS');
                  },
                  child: Image.asset(
                    'assets/images/assets_details_copy.png',
                    width: 16.w,
                    height: 16.w,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(
                  text: assetsDetailsController.depositData['address']));
              SmartDialog.showToast('Copy SUCCESS');
            },
            child: Container(
              width: 343.w,
              height: 48.w,
              decoration: BoxDecoration(
                  color: Color(0XFFD99B21),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0XFF000000), width: 1.0)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border(
                        top: BorderSide(color: Color(0XFFFEFFD1), width: 2.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Copy Address',
                      style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
