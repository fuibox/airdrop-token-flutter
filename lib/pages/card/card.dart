import 'package:airdrop_flutter/controllers/card_list_controller.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/ui/card_dialog.dart';
import 'package:airdrop_flutter/ui/card_send_dialog.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final UserCardListController userCardListController =
      Get.put(UserCardListController());
  final storage = Get.find<StorageService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCardListController.getUserNFCList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: [
      Container(
          width: double.infinity,
          // height: 364.w,
          margin: EdgeInsets.only(top: 44.w),
          decoration: BoxDecoration(),
          child: Column(children: [
            // nav
            Container(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              height: 44.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/images/ld_back.png',
                      height: 24.w,
                      width: 24.w,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 0.w, right: 0.w),
                          width: 110.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: Color(0X33FFFFFF),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, right: 0.w),
                                child: Image.asset(
                                  'assets/images/ic_lang.png',
                                  width: 18.w,
                                  height: 18.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 8.w),
                                child: Text(
                                  'English',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, right: 0.w),
                                child: Image.asset(
                                  'assets/images/ld_sele.png',
                                  width: 14.w,
                                  height: 14.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          width: 60.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: Color(0X33FFFFFF),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 0.w, right: 3.8.w),
                                child: Image.asset(
                                  'assets/images/nav_chest.png',
                                  width: 22.w,
                                  height: 22.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.w),
                                child: Text(
                                  '32',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            child: Image.asset(
                          'assets/images/user_avatar.png',
                          width: 26.w,
                          height: 26.w,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // list
            Container(
                margin: EdgeInsets.only(top: 24.w, bottom: 12.w),
                padding: EdgeInsets.only(left: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'My Modular',
                      style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )),
            Obx(() {
              return Column(
                children: userCardListController.cardList.map((item) {
                  int index = userCardListController.cardList.indexOf(item);
                  final cardItem = userCardListController.cardList.value[index];
                  final imageurl = getImageUrlByCardId(cardItem['cardId']);
                  final name = getNameByCardId(cardItem['cardId']);
                  return Container(
                    width: 343.w,
                    height: 120.w,
                    margin: EdgeInsets.only(bottom: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Color(0XFFFFFFFF).withOpacity(0.12)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border(
                              top: BorderSide(
                                  width: 2.w,
                                  color: Color(0XFFFFFFFF).withOpacity(0.15)))),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 12.w),
                            child: Image.asset(
                              '${imageurl}',
                              width: 66.w,
                              height: 88.w,
                            ),
                          ),
                          Container(
                            width: 140.w,
                            margin: EdgeInsets.only(left: 12.w, right: 23.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Bitcoin, the digital gold,symbol origin of ...',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF).withOpacity(0.8),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: () {
                                    showCardBox(config: cardItem);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Recycle for',
                                        style: TextStyle(
                                            color: Color(0XFFCC9533),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Image.asset(
                                        'assets/images/gcc_token.png',
                                        width: 16.w,
                                        height: 16.w,
                                      ),
                                      Text(
                                        '>',
                                        style: TextStyle(
                                            color: Color(0XFFCC9533),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showCardSendBox(config: cardItem);
                            },
                            child: Container(
                              width: 78.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Color(0XFFBCC0CC)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border(
                                        top: BorderSide(
                                            width: 3.w,
                                            color: Color(0XFFFFFFFF)
                                                .withOpacity(0.65)))),
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
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }),

            Container(
              width: 343.w,
              height: 712.w,
              margin: EdgeInsets.only(top: 20.w, bottom: 32.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0XFFFFFFFF).withOpacity(0.12)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border(
                        top: BorderSide(
                            width: 2.w,
                            color: Color(0XFFFFFFFF).withOpacity(0.15)))),
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.w, bottom: 40.w, left: 16.w),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            child: Image.asset(
                              'assets/images/card_text_icon.png',
                              width: 20.w,
                              height: 20.w,
                            ),
                          ),
                          Text(
                            'GCC AirDrop NFT benefits',
                            style: TextStyle(
                                color: Color(0XFFFFFFFF),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),

                    ///
                    Container(
                      width: 311.w,
                      height: 210.w,
                      decoration: BoxDecoration(
                          color: Color(0XFFE6EBF2).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20.w),
                            width: 120.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/card_btb_bg.png'),
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Benefit 1',
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 100.w,
                                      height: 100.w,
                                      margin: EdgeInsets.only(bottom: 6.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          border: Border.all(
                                              width: 1.w,
                                              color: Color(0XFFFFFFFF)
                                                  .withOpacity(0.2))),
                                      child: Image.asset(
                                        'assets/images/card_sma.png',
                                        width: 60.w,
                                        height: 80.w,
                                      ),
                                    ),
                                    Text(
                                      'Stake GCC',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'AirDrop NFT',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 19.w, right: 19.w, bottom: 35.w),
                                  child: Image.asset(
                                    'assets/images/card_right_icon.png',
                                    width: 40.w,
                                    height: 19.w,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 100.w,
                                      height: 100.w,
                                      margin: EdgeInsets.only(bottom: 6.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          border: Border.all(
                                              width: 1.w,
                                              color: Color(0XFFFFFFFF)
                                                  .withOpacity(0.2))),
                                      child: Image.asset(
                                        'assets/images/card_adt_icons.png',
                                        width: 60.w,
                                        height: 66.w,
                                      ),
                                    ),
                                    Text(
                                      'Receive platform',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'dividends',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.w),
                      width: 311.w,
                      height: 386.w,
                      decoration: BoxDecoration(
                          color: Color(0XFFE6EBF2).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20.w),
                            width: 120.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/card_btb_bg.png'),
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Benefit 2',
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 120.w,
                                      height: 120.w,
                                      margin: EdgeInsets.only(bottom: 6.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          border: Border.all(
                                              width: 1.w,
                                              color: Color(0XFFFFFFFF)
                                                  .withOpacity(0.2))),
                                      child: Image.asset(
                                        'assets/images/card_left_icon.png',
                                        width: 96.w,
                                        height: 96.w,
                                      ),
                                    ),
                                    Text(
                                      'Stake GCC',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'AirDrop NFT',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10.w, right: 10.w, bottom: 0.w),
                                  child: Image.asset(
                                    'assets/images/card_ellipse.png',
                                    width: 32.w,
                                    height: 100.w,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width: 100.w,
                                        height: 104.w,
                                        margin: EdgeInsets.only(bottom: 8.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            border: Border.all(
                                                width: 1.w,
                                                color: Color(0XFFFFFFFF)
                                                    .withOpacity(0.2))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/card_adt_token.png',
                                              width: 64.w,
                                              height: 64.w,
                                            ),
                                            Text(
                                              '\$ ADT',
                                              style: TextStyle(
                                                  color: Color(0XFFEBB946),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        width: 100.w,
                                        height: 104.w,
                                        margin: EdgeInsets.only(bottom: 0.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            border: Border.all(
                                                width: 1.w,
                                                color: Color(0XFFFFFFFF)
                                                    .withOpacity(0.2))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/card_gcc_icon.png',
                                              width: 64.w,
                                              height: 64.w,
                                            ),
                                            Text(
                                              '\$ ADG',
                                              style: TextStyle(
                                                  color: Color(0XFFEBB946),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.w, bottom: 12.w),
                            width: 271.w,
                            child: Row(
                              children: [
                                Text(
                                  '\$ADT:',
                                  style: TextStyle(
                                      color: Color(0XFFEBB946),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Core Token of AirDrop Coins.',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 271.w,
                            child: Wrap(
                              children: [
                                Text(
                                  '\$GCC:',
                                  style: TextStyle(
                                      color: Color(0XFFEBB946),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'AirDrop Gas, an essential token that must',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  ' be consumed when users withdraw.',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
                width: 343.w,
                height: 455.w,
                margin: EdgeInsets.only(top: 0.w, bottom: 20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Color(0XFFFFFFFF).withOpacity(0.12)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border(
                          top: BorderSide(
                              width: 2.w,
                              color: Color(0XFFFFFFFF).withOpacity(0.15)))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 24.w, bottom: 20.w),
                        child: Image.asset(
                          'assets/images/card_bg2.png',
                          width: 316.w,
                          height: 133.w,
                        ),
                      ),
                      Container(
                        width: 311.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Collect all',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              ' 5 ',
                              style: TextStyle(
                                  color: Color(0XFFEBB946),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'cards to create AirDrop Coins',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 311.w,
                        child: Row(
                          children: [
                            Text(
                              'NFT',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16.w, top: 12.w),
                            child: Text(
                              'Total limit: 10000',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16.w, bottom: 16.w),
                            child: Text(
                              'Remaining: 9680',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 311.w,
                        child: Text(
                          'Note: Each user has only one synthesis opportunity. Heavy components can be recycled to obtain a random amount of \$ADG or given to friends',
                          style: TextStyle(
                              color: Color(0XFFFFFFFF),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                          width: 311.w,
                          height: 44.w,
                          margin: EdgeInsets.only(right: 16.w, top: 24.w),
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
                                        width: 2.w, color: Color(0XFFffffff)))),
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
                    ],
                  ),
                )),
          ]))
    ]))));
  }
}
