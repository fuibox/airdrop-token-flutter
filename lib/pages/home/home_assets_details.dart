import 'package:airdrop_flutter/ui/assets_present_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../ui/assets_deposit_dialog.dart';
import '../../ui/assets_withdraw_dialog.dart';

class HomeAssetsDetailsScreen extends StatefulWidget {
  HomeAssetsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HomeAssetsDetailsScreen> createState() =>
      _HomeAssetsDetailsScreenState();
}

class _HomeAssetsDetailsScreenState extends State<HomeAssetsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0XFFD9D9D9),
          image: DecorationImage(
            image: AssetImage('assets/images/assets_bg.png'),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            // nav
            Container(
              margin: EdgeInsets.only(top: 44.w),
              height: 44.w,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    margin: EdgeInsets.only(left: 100.w, right: 44.5.w),
                    child: Text(
                      'Asset Details',
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/record');
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/assets_record.png',
                          width: 16.w,
                          height: 16.w,
                        ),
                        Text(
                          'Records',
                          style: TextStyle(
                              color: Color(0XFF333333),
                              fontSize: 16.sp,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // assets
            Container(
              margin: EdgeInsets.only(top: 24.w, bottom: 12.w),
              child: Image.asset(
                'assets/images/assets_logo.png',
                width: 155.w,
                height: 155.w,
              ),
            ),
            Text(
              'ADT Token',
              style: TextStyle(color: Color(0XFF333333), fontSize: 14.sp),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.w, bottom: 40.w),
              child: Text(
                '22.1221',
                style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w900),
              ),
            ),
            // list
            Container(
              width: 343.w,
              height: 56.w,
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              margin: EdgeInsets.only(bottom: 8.w),
              decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/assets_intro.png',
                        width: 20.w,
                        height: 20.w,
                      ),
                      Text(
                        'Introduction',
                        style: TextStyle(
                            color: Color(0XFF000000), fontSize: 14.sp),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Core assets of AirDrop Coins',
                        style: TextStyle(
                            color: Color(0XFF666666), fontSize: 14.sp),
                      ),
                      Image.asset(
                        'assets/images/ic_arrow.png',
                        width: 12.w,
                        height: 8.w,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 343.w,
              height: 56.w,
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              margin: EdgeInsets.only(bottom: 8.w),
              decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/assets_total.png',
                        width: 20.w,
                        height: 20.w,
                      ),
                      Text(
                        'Total Supply',
                        style: TextStyle(
                            color: Color(0XFF000000), fontSize: 14.sp),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '5 Billion',
                        style: TextStyle(
                            color: Color(0XFF666666), fontSize: 14.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 343.w,
              height: 56.w,
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              margin: EdgeInsets.only(bottom: 8.w),
              decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/assets_sale.png',
                        width: 20.w,
                        height: 20.w,
                      ),
                      Text(
                        'Pre-sale discount',
                        style: TextStyle(
                            color: Color(0XFF000000), fontSize: 14.sp),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '35000 ADT=0.1 BNB',
                        style: TextStyle(
                            color: Color(0XFF666666), fontSize: 14.sp),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
                        child: Image.asset(
                          'assets/images/assets_warn.png',
                          width: 16.w,
                          height: 16.w,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 343.w,
              height: 56.w,
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              margin: EdgeInsets.only(bottom: 8.w),
              decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/assets_value.png',
                        width: 20.w,
                        height: 20.w,
                      ),
                      Text(
                        'Values',
                        style: TextStyle(
                            color: Color(0XFF000000), fontSize: 14.sp),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Trade on exchanges',
                        style: TextStyle(
                            color: Color(0XFF666666), fontSize: 14.sp),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
                        child: Image.asset(
                          'assets/images/assets_right.png',
                          width: 12.w,
                          height: 8.w,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // btn
            Container(
              margin: EdgeInsets.only(top: 25.w, bottom: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showCenterPresent();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16.w),
                      width: 124.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                        color: Color(0XFF000000),
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: Color(0XFF141414),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/assets_pre.png',
                            width: 24.w,
                            height: 24.w,
                          ),
                          Text(
                            'Present',
                            style: TextStyle(
                                color: Color(0XFFFFFFFF),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: 124.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33FFFFFF),
                              offset: Offset(0, 10),
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30.r),
                          gradient: LinearGradient(
                            colors: [Color(0XFFFB801F), Color(0XFFD167E5)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          border:
                              Border.all(width: 1.0, color: Color(0XFF000000))),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border(
                                top: BorderSide(
                                    color: Color(0XFFFEFFD1), width: 2.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Earn More',
                              style: TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showBottomDeposit();
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 16.w),
                  width: 343.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Color(0XFFD99B21),
                      border: Border.all(color: Color(0XFF000000), width: 1.0)),
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
                          'Deposit',
                          style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                showBottomWithDraw();
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20.w),
                width: 343.w,
                height: 48.w,
                decoration: BoxDecoration(
                    color: Color(0XFF000000),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Color(0XFF141414), width: 1.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Withdraw',
                      style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
