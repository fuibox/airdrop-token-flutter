import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void showBottomPledge({String message = 'test'}) {
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
      child: Column(
        children: [
          //nav
          Container(
            margin: EdgeInsets.only(bottom: 36.w),
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
                Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    'Daily Rewards',
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
          ),

          // box
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.w),
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(13.r)),
                width: 161.w,
                height: 140.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/earn_box.png',
                      width: 88.w,
                      height: 88.w,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'D-DIN-PRO',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0.w),
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(13.r)),
                width: 161.w,
                height: 140.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/pledge_adt.png',
                      width: 88.w,
                      height: 88.w,
                    ),
                    Text(
                      '5',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'D-DIN-PRO',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ],
          ),

          Container(
              margin: EdgeInsets.only(top: 16.w, bottom: 20.w),
              alignment: Alignment.center,
              width: 311.w,
              child: Text(
                'Stake BNB to receive daily rewards. BNB can only be withdrawn after 30 days.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff000000),
                    fontFamily: 'Figtree',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              )),

          Container(
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
                    'Withdraw',
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
        ],
      ),
    ),
  );
}
