import 'package:airdrop_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListScreen extends StatefulWidget {
  HomeListScreen({Key? key}) : super(key: key);

  @override
  State<HomeListScreen> createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 343.w,
            height: 56.w,
            margin: EdgeInsets.only(bottom: 8.w),
            padding: EdgeInsets.only(left: 19.w, right: 19.w),
            decoration: BoxDecoration(
              color: Color(0XFF1F0B0E),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33FFFFFF),
                  offset: Offset(0, -3),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/adg_token.png',
                        width: 25.w, height: 25.h),
                    Container(
                      margin: EdgeInsets.only(left: 4.w),
                      child: Text(
                        'ADG',
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
                        '80.000000000',
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
          Container(
            width: 343.w,
            height: 56.w,
            margin: EdgeInsets.only(bottom: 4.w),
            padding: EdgeInsets.only(left: 19.w, right: 19.w),
            decoration: BoxDecoration(
              color: Color(0XFF1F0B0E),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33FFFFFF),
                  offset: Offset(0, -3),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/adt_token.png',
                        width: 25.w, height: 25.h),
                    Container(
                      margin: EdgeInsets.only(left: 4.w),
                      child: Text(
                        'GCC',
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
                        '80.000000000',
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
          )
        ],
      ),
    );
  }
}
