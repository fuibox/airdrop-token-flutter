import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void showEarnAirdropBox({String message = 'test'}) {
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    builder: (_) => Container(
      height: 535.w,
      width: double.infinity,
      padding: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Color(0XFFE6EBF2),
      ),
      child: Column(
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
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Text(
                  'Airdrop Boxes Exchange',
                  style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
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
            margin: EdgeInsets.only(top: 28.w, bottom: 34.w),
            child: Image.asset(
              'assets/images/dialog_box.png',
              width: 160.w,
              height: 160.w,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 163.w,
                height: 40.w,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color(0XFFDADFE5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: Image.asset(
                        'assets/images/dialog_box.png',
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    Text(
                      '5',
                      style: TextStyle(
                          color: Color(0XFF0000000),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                width: 163.w,
                height: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color(0XFFDADFE5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: Image.asset(
                        'assets/images/dialog_box.png',
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                          color: Color(0XFF0000000),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.w, bottom: 26.w),
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
                                color: Color(0XFFFFFFFF).withOpacity(0.65)))),
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
                          '1',
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
                                color: Color(0XFFFFFFFF).withOpacity(0.65)))),
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
            margin: EdgeInsets.only(bottom: 0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Required:',
                  style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/adt_token.png',
                      width: 17.w,
                      height: 17.w,
                    ),
                    Text(
                      ' 2000',
                      style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            margin: EdgeInsets.only(bottom: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Balance:',
                  style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/adt_token.png',
                      width: 17.w,
                      height: 17.w,
                    ),
                    Text(
                      ' 2000',
                      style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 340.w,
                  height: 48.w,
                  margin: EdgeInsets.only(right: 0.w),
                  decoration: BoxDecoration(
                      color: Color(0XFFD99B21),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(width: 1.w, color: Color(0XFF000000))),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border(
                            top: BorderSide(
                                width: 1.w, color: Color(0XFFFEFFD1)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BUY',
                          style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    ),
  );
}
