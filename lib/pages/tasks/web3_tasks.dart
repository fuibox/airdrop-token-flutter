import 'package:airdrop_flutter/ui/coutdownTime.dart';
import 'package:airdrop_flutter/ui/task_pledge_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Web3TasksScreen extends StatefulWidget {
  Web3TasksScreen({Key? key}) : super(key: key);

  @override
  State<Web3TasksScreen> createState() => _Web3TasksScreenState();
}

class _Web3TasksScreenState extends State<Web3TasksScreen> {
  int endTime =
      DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60; // 1小时的倒计时

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 33.w),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.w, bottom: 13.w),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 9.w),
                    child: Image.asset(
                      'assets/images/task_web3_icon.png',
                      width: 18.w,
                      height: 18.w,
                    ),
                  ),
                  Text(
                    'The Web3 Task',
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Figtree'),
                  ),
                ],
              ),
            ),
            Container(
              width: 343.w,
              height: 154.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: const LinearGradient(
                  colors: [Color(0XFF3D3640), Color(0XFF4D3D26)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border(
                        top: BorderSide(
                            width: 2.w,
                            color: Color(0XFFFFFFFF).withOpacity(0.25)))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16.w),
                      width: 311.w,
                      height: 98.w,
                      padding: EdgeInsets.only(left: 12.w, top: 12.w),
                      decoration: BoxDecoration(
                          color: Color(0XFF000000).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8.w),
                                child: Image.asset(
                                  'assets/images/task_social_icon3.png',
                                  width: 24.w,
                                  height: 24.w,
                                ),
                              ),
                              Container(
                                width: 255.w,
                                child: Text(
                                  'Stake 0.002 BNB and receive 1 Airdrop box and \$5 ADT every day.',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 14.sp,
                                      fontFamily: 'Figtree',
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/nav_chest.png',
                                  width: 22.w,
                                  height: 22.w,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 12.w),
                                  child: Text(
                                    '+30',
                                    style: TextStyle(
                                        color: Color(0XFFFFFFFF),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'D-DIN-PRO'),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/adt_token.png',
                                  width: 22.w,
                                  height: 22.w,
                                ),
                                Text(
                                  '+3000',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'D-DIN-PRO'),
                                ),
                                InkWell(
                                  onTap: () {
                                    showBottomPledge();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 40.w),
                                    width: 120.w,
                                    height: 32.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: Color(0XFFD99B21)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          border: Border(
                                              top: BorderSide(
                                                  width: 2.w,
                                                  color: Color(0XFFFEFFD1)
                                                      .withOpacity(0.65)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Join Now',
                                            style: TextStyle(
                                                color: Color(0XFF000000),
                                                fontSize: 14.sp,
                                                fontFamily: 'Figtree',
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.w),
                      width: 311.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0Xhajhjasda....78xsaa',
                            style: TextStyle(
                                color: Color(0XFFe5b045),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Figtree'),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/task_broken.png',
                                width: 16.w,
                                height: 16.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 4.w),
                                child: Text(
                                  'Disconnect',
                                  style: TextStyle(
                                      color: Color(0Xffe5b045),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Figtree'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.w),
              width: 343.w,
              height: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0xffffffff).withOpacity(0.15)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border(
                        top: BorderSide(
                            width: 2.w,
                            color: Color(0xffffffff).withOpacity(0.15)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Text(
                            'Complete pledge before',
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 14.sp,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16.w),
                          child: CustomCountdownTimer(
                            endTime: endTime, // 传递结束时间
                            digitStyle: TextStyle(
                              fontSize: 20.sp, // 自定义字体大小
                              fontFamily: 'D-DIN-PRO',
                              fontWeight: FontWeight.w700, // 自定义字体粗细
                              color: Color(0xff000000), // 自定义字体颜色
                            ),
                            separatorStyle: TextStyle(
                              fontSize: 30.sp, // 自定义分隔符的字体大小
                              fontWeight: FontWeight.w700, // 自定义分隔符的字体粗细
                              color: Color(0xffaaaaaa), // 自定义分隔符颜色
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 16.w, top: 0.w),
                            width: 311.w,
                            height: 44.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w, color: Color(0xff000000)),
                              borderRadius: BorderRadius.circular(100.sp),
                              gradient: const LinearGradient(
                                colors: [Color(0XFFFB801F), Color(0XFFD167E5)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.sp),
                                  border: Border(
                                      top: BorderSide(
                                          width: 2.w,
                                          color: Color(0xffd9d9d9)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Text(
                                      'Get immediately',
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Figtree'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/nav_chest.png',
                                          width: 22.w,
                                          height: 22.w,
                                        ),
                                        Text(
                                          '+10',
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Figtree'),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
