import 'package:airdrop_flutter/controllers/card_list_controller.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void showCardSendBox({String message = 'test', required Map config}) {
  // FocusNode 控制焦点，键盘弹出页面滚动
  FocusNode _focusNodeTGid = FocusNode();

  TextEditingController _controllerTGid = TextEditingController();
  final UserCardListController userCardListController =
      Get.put(UserCardListController());
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    builder: (_) => Container(
        height: 560.w,
        width: double.infinity,
        padding: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Color(0XFFE6EBF2),
        ),
        child: Obx(() {
          final imageurl = getImageUrlByCardId(config['cardId']);
          final name = getNameByCardId(config['cardId']);
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                margin: EdgeInsets.only(top: 0.w, bottom: 34.w),
                child: Image.asset(
                  '${imageurl}',
                  width: 160.w,
                  height: 160.w,
                ),
              ),
              Text(
                '${name} CARD',
                style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                width: 300.w,
                alignment: Alignment.center,
                child: Text(
                  'Ethereum, the cradle of smart contracts, ushers in a new era of decentralized finance',
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.w, bottom: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF000000)),
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0XFFBCC0CC)),
                      width: 80.w,
                      height: 40.w,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border(
                                top: BorderSide(
                                    width: 2.w,
                                    color:
                                        Color(0XFFFFFFFF).withOpacity(0.65)))),
                        child: Image.asset(
                          'assets/images/earn_dialog_left.png',
                          width: 20.w,
                          height: 3.33.w,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                            color: Color(0XFFFFFFFF),
                            borderRadius: BorderRadius.circular(8.r)),
                        width: 143.w,
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${userCardListController.cardNum}',
                              style: TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF000000)),
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0XFFBCC0CC)),
                      width: 80.w,
                      height: 40.w,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border(
                                top: BorderSide(
                                    width: 2.w,
                                    color:
                                        Color(0XFFFFFFFF).withOpacity(0.65)))),
                        child: Image.asset(
                          'assets/images/earn_dialog_right.png',
                          width: 20.w,
                          height: 20.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                margin: EdgeInsets.only(bottom: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          '${config['balance']} available',
                          style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w100),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 343.w,
                height: 48.w,
                padding: EdgeInsets.only(left: 12.w),
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: TextField(
                  onChanged: (value) {
                    userCardListController.cardTgId.value = value;
                    AppLogger.instance.d(userCardListController.cardTgId.value);
                  },
                  controller: _controllerTGid,
                  focusNode: _focusNodeTGid,
                  keyboardType: TextInputType.number,
                  cursorColor: const Color(0xFFCC9533),
                  decoration: InputDecoration(
                      hintText: 'Enter the user\'s User ID',
                      hintStyle:
                          TextStyle(color: Color(0XFFCCCCCC), fontSize: 14.sp),
                      border: InputBorder.none),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 5.w),
                  margin: EdgeInsets.only(bottom: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Please enter the User ID you want to send to',
                        style: TextStyle(
                            color: Colors.green[700], fontSize: 12.sp),
                      ),
                    ],
                  )),
              InkWell(
                onTap: () {
                  final address = userCardListController.cardTgId.value;
                  final amount = userCardListController.cardNum.value;
                  if (address.length > 0) {
                    userCardListController.UserGiftCard(
                        config['cardId'].toString(),
                        address.toString(),
                        amount.toString());
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 340.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                              Border.all(width: 1.w, color: Color(0xff000000)),
                          color:
                              userCardListController.cardTgId.value.length > 0
                                  ? Color(0XFFD99B21)
                                  : Color(0XFFBCC0CC)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border(
                                top: BorderSide(
                                    width: 2.w,
                                    color: Color(0XFFFFFFFF).withOpacity(1)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card_btn_icon.png',
                              width: 16.w,
                              height: 16.w,
                            ),
                            Text(
                              ' Gift',
                              style: TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        })),
  );
}
