import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void showBottomCorrect({String message = 'test'}) {
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    builder: (_) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Color(0XFFD9D9D9),
          image: DecorationImage(
            image: AssetImage('assets/images/assets_bg.png'),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
        height: 386.w,
        width: double.infinity,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/task_success_bg.png'),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              //nav
              Container(
                margin: EdgeInsets.only(bottom: 20.w),
                child: Row(
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
              ),
              Container(
                margin: EdgeInsets.only(bottom: 33.w),
                child: Image.asset(
                  'assets/images/task_success.png',
                  width: 64.w,
                  height: 64.w,
                ),
              ),
              Container(
                width: 311.w,
                child: Text(
                  'You\'ve completed the basic task and unlocked the Q&A task.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'Figtree',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 14.w, bottom: 46.w),
                width: 311.w,
                child: Text(
                  'Complete the pledge task within 24 hours to get 3 Airdrop boxes immediately.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'Figtree',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              InkWell(
                onTap: () {
                  SmartDialog.dismiss();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0.w),
                  width: 343.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Color(0xff000000)),
                      borderRadius: BorderRadius.circular(8.r),
                      color: Color(0XFFD99B21)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border(
                            top: BorderSide(
                                width: 2.w,
                                color: Color(0XFFFEFFD1).withOpacity(0.65)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'To Complete',
                          style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16.sp,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
  );
}
