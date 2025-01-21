import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/animtedNumber.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EarnAdtApplicationZone extends StatefulWidget {
  EarnAdtApplicationZone({Key? key}) : super(key: key);

  @override
  State<EarnAdtApplicationZone> createState() => _EarnAdtApplicationZoneState();
}

class _EarnAdtApplicationZoneState extends State<EarnAdtApplicationZone> {
  final storage = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // ADT application Zone
          Container(
            margin: EdgeInsets.only(top: 24.w, bottom: 16.w),
            child: Text(
              'ADT Application Zone',
              style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),

          Container(
            width: 343.w,
            height: 283.w,
            padding: EdgeInsets.only(top: 0.w),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/earn_card_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // assets
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 13.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/adt_icon.png',
                            width: 20.w,
                            height: 20.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4.w),
                            child: Text(
                              'Prize Pool',
                              style: TextStyle(
                                  color: Color(0xFF5A410B),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(() {
                      return AnimatedNumber(
                        endValue: storage.prizePool.value['totalUsdtValue'],
                        durationInSeconds: 3,
                        decimalPlaces: 2,
                        textStyle: TextStyle(
                            color: Color(0xFF141414),
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700),
                      );
                    }),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/adt_icon.png',
                            width: 12.w,
                            height: 12.w,
                          ),
                          Text(
                            'Circulating Supply: ',
                            style: TextStyle(
                                color: Color(0XFF332E23),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Obx(() {
                            return AnimatedNumber(
                              endValue:
                                  storage.prizePool.value['totalGemSupply'],
                              durationInSeconds: 3,
                              decimalPlaces: 2,
                              textStyle: TextStyle(
                                  color: Color(0XFF332E23),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.w),
                  width: 339.w,
                  height: 179.w,
                  padding: EdgeInsets.only(top: 24.w, left: 26.w, right: 0.w),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/earn_bg2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Obx(() {
                        if (storage.prizePool.value['prizeItems']?.isNotEmpty ??
                            false) {
                          var prizeItems =
                              storage.prizePool.value['prizeItems'];
                          return Container(
                            width: 311.w,
                            height: 82.w,
                            child: Row(
                              children: [
                                Container(
                                  width: 106.w,
                                  margin: EdgeInsets.only(right: 30.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            '${prizeItems[0]['icon']}',
                                            width: 14.w,
                                            height: 14.w,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 4.w, right: 8.w),
                                            child: Text(
                                              '${prizeItems[0]['name']}',
                                              style: TextStyle(
                                                  color: Color(0XFFFFFFFF),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Text(
                                            '${formatNumber(prizeItems[0]['amount'], decimalPlaces: 2)}',
                                            style: TextStyle(
                                                color: Color(0XFFE5B045),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 8.w, bottom: 8.w),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              '${prizeItems[2]['icon']}',
                                              width: 14.w,
                                              height: 14.w,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 4.w, right: 8.w),
                                              child: Text(
                                                '${prizeItems[2]['name']}',
                                                style: TextStyle(
                                                    color: Color(0XFFFFFFFF),
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Text(
                                              '${formatNumber(prizeItems[2]['amount'], decimalPlaces: 2)}',
                                              style: TextStyle(
                                                  color: Color(0XFFE5B045),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.network(
                                            '${prizeItems[4]['icon']}',
                                            width: 14.w,
                                            height: 14.w,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 4.w, right: 8.w),
                                            child: Text(
                                              '${prizeItems[4]['name']}',
                                              style: TextStyle(
                                                  color: Color(0XFFFFFFFF),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          AnimatedNumber(
                                            endValue: prizeItems[4]['amount'],
                                            durationInSeconds: 3,
                                            decimalPlaces: 2,
                                            textStyle: TextStyle(
                                                color: Color(0XFFE5B045),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700),
                                            showDollarSign: false,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 106.w,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            '${prizeItems[1]['icon']}',
                                            width: 14.w,
                                            height: 14.w,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 4.w, right: 8.w),
                                            child: Text(
                                              '${prizeItems[1]['name']}',
                                              style: TextStyle(
                                                  color: Color(0XFFFFFFFF),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Text(
                                            '${formatNumber(prizeItems[1]['amount'], decimalPlaces: 2)}',
                                            style: TextStyle(
                                                color: Color(0XFFE5B045),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 8.w, bottom: 8.w),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              '${prizeItems[3]['icon']}',
                                              width: 14.w,
                                              height: 14.w,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 4.w, right: 8.w),
                                              child: Text(
                                                '${prizeItems[3]['name']}',
                                                style: TextStyle(
                                                    color: Color(0XFFFFFFFF),
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            AnimatedNumber(
                                              endValue: prizeItems[3]['amount'],
                                              durationInSeconds: 3,
                                              decimalPlaces: 2,
                                              textStyle: TextStyle(
                                                  color: Color(0XFFE5B045),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700),
                                              showDollarSign: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 106.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/images/earn_icons.png',
                                              width: 50.w,
                                              height: 14.w,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            child: Text('Null Data'),
                          );
                        }
                      }),
                      // text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prize Pool Composition',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0XFFE5B045),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 2.17.w),
                                child: Image.asset(
                                  'assets/images/earn_icon4.png',
                                  width: 4.w,
                                  height: 4.w,
                                ),
                              ),
                              Text(
                                '100% of the revenue from the AirDrop Coins MiniApp and DApp applications',
                                style: TextStyle(
                                    color: Color(0XFFE5B045),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 2.17.w),
                                child: Image.asset(
                                  'assets/images/earn_icon4.png',
                                  width: 4.w,
                                  height: 4.w,
                                ),
                              ),
                              Text(
                                '100% of the sponsorship from AirDrop Coins partners',
                                style: TextStyle(
                                    color: Color(0XFFE5B045),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 2.17.w),
                                child: Image.asset(
                                  'assets/images/earn_icon4.png',
                                  width: 4.w,
                                  height: 4.w,
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                '100% of the revenue from third-party brand collaborations with AirDrop Coins',
                                style: TextStyle(
                                    color: Color(0XFFE5B045),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500),
                              ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 343.w,
            height: 222.w,
            margin: EdgeInsets.only(top: 23.w, bottom: 23.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                colors: [
                  Color(0XFFFFFFFF).withOpacity(0.12),
                  Color(0XFFFFFFFF).withOpacity(0.04)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 20.w, left: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border(
                      top: BorderSide(
                          width: 1.w,
                          color: Color(0XFFFFFFFF).withOpacity(0.15)))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Collect',
                        style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' 5 ',
                        style: TextStyle(
                            color: Color(0XFFE6B24D),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Modular cards to obtain AirDrop',
                        style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Coins NFT',
                        style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.w, bottom: 24.w),
                    child: Text(
                      'Note: Each user has only one opportunity to synthesize. Duplicate module cards can be recycled for a random ADG reward or gifted to friends.',
                      style: TextStyle(
                          color: Color(0XFFFE6759),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed('/card');
                        },
                        child: Container(
                            width: 140.w,
                            height: 40.w,
                            margin: EdgeInsets.only(right: 15.w),
                            decoration: BoxDecoration(
                                color: Color(0XFFD99B21),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    width: 1.w, color: Color(0XFF000000))),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border(
                                      top: BorderSide(
                                          width: 1.w,
                                          color: Color(0XFFFEFFD1)))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Synthesize Now',
                                    style: TextStyle(
                                        color: Color(0XFF0D0900),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Container(
                          width: 140.w,
                          height: 40.w,
                          margin: EdgeInsets.only(right: 15.w),
                          decoration: BoxDecoration(
                              color: Color(0XFFBCC0CC),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1.w, color: Color(0XFF000000))),
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
                                  'Recycle Now',
                                  style: TextStyle(
                                      color: Color(0XFF0D0900),
                                      fontSize: 14.sp,
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
          )
        ],
      ),
    );
  }
}
