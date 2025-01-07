import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void showBottomWithDraw({String message = 'test'}) {
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
                            AppLogger.instance.d(value);
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
                      Image.asset(
                        'assets/images/scan_code_icon.png',
                        width: 16.w,
                        height: 16.w,
                      )
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
                      'BNB Smart Chain(BEP20)',
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
                        controller: _controllerNumber,
                        focusNode: _focusNodeNumber,
                        keyboardType: TextInputType.number,
                        cursorColor: const Color(0xFFCC9533),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/adt_token.png',
                          width: 14.55.w,
                          height: 14.55.w,
                        ),
                        Text(
                          'ADT',
                          style: TextStyle(
                              color: Color(0XFF000000), fontSize: 14.sp),
                        )
                      ],
                    )
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
                        '88.1234 ADT',
                        style: TextStyle(
                            color: Color(0XFF0000000), fontSize: 14.sp),
                      ),
                    ),
                    Text(
                      'Max',
                      style:
                          TextStyle(color: Color(0XFFA66B19), fontSize: 14.sp),
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
                        Container(
                          margin: EdgeInsets.only(right: 9.w),
                          child: Text(
                            '5',
                            style: TextStyle(
                                color: Color(0XFF000000),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Image.asset(
                          'assets/images/dialog_adc.png',
                          width: 16.w,
                          height: 16.w,
                        ),
                        Text(
                          'ADG',
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
              Container(
                  width: 343.w,
                  height: 48.w,
                  margin: EdgeInsets.only(top: 36.w),
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
                        Text(
                          'Withdraw',
                          style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        )),
  );
}
