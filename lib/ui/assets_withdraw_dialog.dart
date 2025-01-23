import 'package:airdrop_flutter/controllers/assets_details_controller.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void showBottomWithDraw({String message = 'test', required Map config}) {
  AssetsDetailsController assetsDetailsController =
      Get.put(AssetsDetailsController());
  final storage = Get.find<StorageService>();
  // FocusNode 控制焦点，键盘弹出页面滚动
  FocusNode _focusNodeText = FocusNode();
  FocusNode _focusNodeNumber = FocusNode();

  TextEditingController _controllerText = TextEditingController();
  TextEditingController _controllerNumber = TextEditingController();
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    builder: (_) => Container(
        height: 608.w,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0XFFE6EBF2),
            borderRadius: BorderRadius.circular(30.r)),
        padding: EdgeInsets.only(top: 12.w, left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      'Withdraw ADT',
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
              Container(
                margin: EdgeInsets.only(top: 36.w, bottom: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style:
                          TextStyle(color: Color(0XFF797272), fontSize: 12.sp),
                    )
                  ],
                ),
              ),
              Container(
                  width: 343.w,
                  height: 48.w,
                  padding: EdgeInsets.only(right: 15.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Color(0XFFFFFFFF)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 13.w),
                        width: 250.w,
                        child: TextField(
                          onChanged: (value) {
                            assetsDetailsController.withDrawAddress.value =
                                value;
                            AppLogger.instance.d(
                                assetsDetailsController.withDrawAddress.value);
                          },
                          controller: _controllerText,
                          focusNode: _focusNodeText,
                          keyboardType: TextInputType.text,
                          cursorColor: const Color(0xFFCC9533),
                          decoration: InputDecoration(
                              hintText: 'Long press to paste',
                              hintStyle: TextStyle(
                                  color: Color(0XFFCCCCCC), fontSize: 14.sp),
                              border: InputBorder.none),
                        ),
                      ),
                      // Image.asset(
                      //   'assets/images/scan_code_icon.png',
                      //   width: 16.w,
                      //   height: 16.w,
                      // )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 16.w, bottom: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Mainnet',
                      style:
                          TextStyle(color: Color(0XFF797272), fontSize: 12.sp),
                    )
                  ],
                ),
              ),
              Container(
                width: 343.w,
                height: 48.w,
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                decoration: BoxDecoration(
                    color: Color(0XFFFFFFFF),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Binance Smart Chain',
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0XFF000000)),
                    ),
                    Image.asset(
                      'assets/images/ic_arrow.png',
                      width: 12.w,
                      height: 12.w,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.w, bottom: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Amount',
                      style:
                          TextStyle(color: Color(0XFF797272), fontSize: 12.sp),
                    )
                  ],
                ),
              ),
              Container(
                width: 343.w,
                height: 48.w,
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
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
                          assetsDetailsController.withDrawAmount.value = value;
                          AppLogger.instance
                              .d(assetsDetailsController.withDrawAmount.value);
                        },
                        controller: _controllerNumber,
                        focusNode: _focusNodeNumber,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')), // 限制只能输入数字和最多两位小数
                        ],
                        cursorColor: const Color(0xFFCC9533),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       'assets/images/adt_token.png',
                    //       width: 14.55.w,
                    //       height: 14.55.w,
                    //     ),
                    //     Text(
                    //       'ADT',
                    //       style: TextStyle(
                    //           color: Color(0XFF000000), fontSize: 14.sp),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.w, bottom: 8.w),
                child: Row(
                  children: [
                    Text(
                      'Balance',
                      style:
                          TextStyle(color: Color(0XFF666666), fontSize: 14.sp),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 13.w, right: 12.w),
                      child: Text(
                        '${formatNumber(config['amount'], decimalPlaces: 4)} ${config['name']}',
                        style: TextStyle(
                            color: Color(0XFF0000000), fontSize: 14.sp),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        assetsDetailsController.withDrawAmount.value =
                            config['amount'];
                        _controllerNumber.text = config['amount'];
                      },
                      child: Text(
                        'Max',
                        style: TextStyle(
                            color: Color(0XFFA66B19), fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'Do not withdraw tokens to contract addresses. Otherwise, your assets will be lost and cannot be retrieved.',
                style: TextStyle(
                  color: Color(0XFF999999),
                  fontSize: 12.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 31.w, bottom: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gas',
                      style:
                          TextStyle(color: Color(0XFF050505), fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        Obx(() {
                          return Container(
                            margin: EdgeInsets.only(right: 9.w),
                            child: Text(
                              '${assetsDetailsController.getFormattedWithDrawAmount()}',
                              style: TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          );
                        }),
                        Image.network(
                          '${config['icon']}',
                          width: 16.w,
                          height: 16.w,
                        ),
                        Text(
                          '${config['name']}',
                          style: TextStyle(
                              color: Color(0XFF000000), fontSize: 14.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1',
                      style: TextStyle(color: Color(0X00FFFFFFF)),
                    ),
                    Row(
                      children: [
                        Text(
                          'Earn ADG by playing games. ',
                          style: TextStyle(
                              color: Color(0XFFA66B19), fontSize: 12.sp),
                        ),
                        Image.asset(
                          'assets/images/draw_right.png',
                          width: 12.w,
                          height: 12.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Obx(() {
                final amt = assetsDetailsController.withDrawAmount.value;
                final add = assetsDetailsController.withDrawAddress.value;
                return InkWell(
                  onTap: () {
                    if (_controllerNumber != null &&
                        _controllerText.text != null) {
                      var amount = double.parse(
                          assetsDetailsController.withDrawAmount.value);
                      var address =
                          assetsDetailsController.withDrawAddress.value;
                      var assetId = config['assetId'].toString();
                      var chainId =
                          assetsDetailsController.depositData['chainId'];
                      assetsDetailsController.userAssetWithdraw(
                          assetId, address, amount, chainId);
                    }
                  },
                  child: Container(
                      width: 343.w,
                      height: 48.w,
                      margin: EdgeInsets.only(top: 36.w),
                      decoration: BoxDecoration(
                          color: amt.length > 0 && add.length > 0
                              ? Color(0XFFD99B21)
                              : Color(0XFFBCC0CC),
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                              Border.all(width: 1.0, color: Color(0XFF000000))),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border(
                                top: BorderSide(
                                    width: 2.0, color: Color(0XFFffffff)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Withdraw',
                              style: TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      )),
                );
              })
            ],
          ),
        )),
  );
}
