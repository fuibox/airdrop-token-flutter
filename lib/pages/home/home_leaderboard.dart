import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import '../../controllers/ranking_controller.dart';

class HomeLeaderboardScreen extends StatefulWidget {
  HomeLeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<HomeLeaderboardScreen> createState() => _HomeLeaderboardScreenState();
}

class _HomeLeaderboardScreenState extends State<HomeLeaderboardScreen> {
  final RankingController rankController = Get.put(RankingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rankController.getRankList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            // height: 364.w,
            margin: EdgeInsets.only(top: 44.w),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ld_bg.png'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
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
                                    padding:
                                        EdgeInsets.only(left: 0.w, right: 0.w),
                                    child: Image.asset(
                                      'assets/images/ic_lang.png',
                                      width: 18.w,
                                      height: 18.w,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.w, right: 8.w),
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
                                    padding:
                                        EdgeInsets.only(left: 0.w, right: 0.w),
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
                                    padding: EdgeInsets.only(
                                        left: 0.w, right: 3.8.w),
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
                Container(
                  margin: EdgeInsets.only(top: 19.w, bottom: 27.w),
                  child: Text(
                    'Ranking',
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Obx(() {
                  if (rankController.rankingList.isNotEmpty) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 2
                          Container(
                            width: 100.w,
                            height: 189.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/two_bg.png'),
                                    fit: BoxFit.contain,
                                    alignment: Alignment.bottomCenter)),
                            child: Column(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 88.w,
                                  padding: EdgeInsets.only(top: 10.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/ld_border_two.png'),
                                          fit: BoxFit.contain,
                                          alignment: Alignment.center)),
                                  child: Image.asset(
                                    'assets/images/ld_two_user.png',
                                    width: 60.w,
                                    height: 60.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 8.w, bottom: 8.w),
                                  child: Text(
                                    'TOP2',
                                    style: TextStyle(
                                        color: Color(0XFFEBB946),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Text(
                                  '${rankController.rankingList[1]['userName']}',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 12.sp),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      '${rankController.rankingList[1]['assetIcon']}',
                                      width: 12.7.w,
                                      height: 12.7.w,
                                    ),
                                    Text(
                                      '${formatNumber(rankController.rankingList[1]['balance'], decimalPlaces: 0)}',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // 1
                          Container(
                            margin: EdgeInsets.only(left: 15.w, right: 15.w),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/one_bg.png'),
                                    fit: BoxFit.contain,
                                    alignment: Alignment.bottomCenter)),
                            width: 114.w,
                            height: 202.w,
                            child: Column(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 88.w,
                                  padding: EdgeInsets.only(top: 10.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/ld_one_border.png'),
                                          fit: BoxFit.contain,
                                          alignment: Alignment.center)),
                                  child: Image.asset(
                                    'assets/images/ld_two_user.png',
                                    width: 60.w,
                                    height: 60.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 8.w, bottom: 8.w),
                                  child: Text(
                                    'TOP1',
                                    style: TextStyle(
                                        color: Color(0XFFEBB946),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Text(
                                  '${rankController.rankingList[0]['userName']}',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 12.sp),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      '${rankController.rankingList[0]['assetIcon']}',
                                      width: 12.7.w,
                                      height: 12.7.w,
                                    ),
                                    Text(
                                      '${formatNumber(rankController.rankingList[0]['balance'], decimalPlaces: 0)}',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // 3
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ld_two_bg.png'),
                                    fit: BoxFit.contain,
                                    alignment: Alignment.bottomCenter)),
                            width: 100.w,
                            height: 189.w,
                            child: Column(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 88.w,
                                  padding:
                                      EdgeInsets.only(top: 10.w, right: 2.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/ld_border_th.png'),
                                          fit: BoxFit.contain,
                                          alignment: Alignment.center)),
                                  child: Image.asset(
                                    'assets/images/ld_two_user.png',
                                    width: 60.w,
                                    height: 60.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 8.w, bottom: 8.w),
                                  child: Text(
                                    'TOP3',
                                    style: TextStyle(
                                        color: Color(0XFFEBB946),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Text(
                                  '${rankController.rankingList[2]['userName']}',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 12.sp),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      '${rankController.rankingList[2]['assetIcon']}',
                                      width: 12.7.w,
                                      height: 12.7.w,
                                    ),
                                    Text(
                                      '${formatNumber(rankController.rankingList[2]['balance'], decimalPlaces: 0)}',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 389.w,
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r)),
                        border: const Border(
                            top: BorderSide(
                          width: 1.0,
                          color: Color(0X99FEFFD1),
                        )),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0XFF594324),
                            Color(0XFF0D0900),
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: EasyRefresh(
                        header: null,
                        onRefresh: () async {
                          // 下拉刷新
                          rankController.refreshData();
                        },
                        onLoad: () async {
                          // 加载更多
                          rankController.loadMoreData();
                        },
                        child: Obx(() {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: rankController.rankingList.length,
                            itemBuilder: (context, index) {
                              final item = rankController.rankingList[index];

                              // 渲染排名数据
                              return Container(
                                width: 334.w,
                                height: 65.w,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.w,
                                            color: Color(0XFFFFFFFF)
                                                .withAlpha(10)))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        if (index == 0)
                                          Image.asset(
                                            'assets/images/one_icon.png',
                                            width: 24.w,
                                            height: 24.w,
                                          )
                                        else if (index == 1)
                                          Image.asset(
                                            'assets/images/two_icon.png',
                                            width: 24.w,
                                            height: 24.w,
                                          )
                                        else if (index == 2)
                                          Image.asset(
                                            'assets/images/th_icon.png',
                                            width: 24.w,
                                            height: 24.w,
                                          )
                                        else
                                          Container(
                                            padding: EdgeInsets.only(left: 5.w),
                                            margin:
                                                EdgeInsets.only(right: 12.w),
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                  color: Color(0xffffffff),
                                                  fontFamily: 'D-DIN-PRO',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        item['avatar'] == null
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    left: 9.w, right: 8.w),
                                                child: Image.asset(
                                                  'assets/images/user_avatar.png',
                                                  width: 40.w,
                                                  height: 40.w,
                                                ),
                                              )
                                            :
                                            // Container(
                                            //     margin: EdgeInsets.only(
                                            //         left: 9.w, right: 8.w),
                                            //     child: SvgPicture.network(
                                            //       '${item['avatar']}',

                                            //       width: 40.w,
                                            //     ),
                                            //   ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 9.w, right: 8.w),
                                                child: Image.asset(
                                                  'assets/images/user_avatar.png',
                                                  width: 40.w,
                                                  height: 40.w,
                                                ),
                                              ),
                                        Text(
                                          item['userName'] ?? '',
                                          style: TextStyle(
                                              color: Color(0XFFFFFFFF),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(right: 2.73.w),
                                          child: Image.network(
                                            '${item['assetIcon']}',
                                            width: 14.55.w,
                                            height: 14.55.w,
                                          ),
                                        ),
                                        Text(
                                          '${formatNumber(item['balance'], decimalPlaces: 2)}',
                                          style: TextStyle(
                                              color: Color(0XFFFFFFFF),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    Obx(() {
                      if (rankController.userInfoRank.isNotEmpty) {
                        return Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 337.w,
                              height: 59.w,
                              padding: EdgeInsets.only(left: 14.w, right: 14.w),
                              margin: EdgeInsets.only(left: 19.w, right: 19.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffD99B21),
                                  border: Border.all(
                                      width: 1.w, color: Color(0xff000000)),
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      if (rankController
                                              .userInfoRank.value['rank'] ==
                                          1)
                                        Image.asset(
                                          'assets/images/one_icon.png',
                                          width: 24.w,
                                          height: 24.w,
                                        )
                                      else if (rankController
                                              .userInfoRank.value['rank'] ==
                                          2)
                                        Image.asset(
                                          'assets/images/two_icon.png',
                                          width: 24.w,
                                          height: 24.w,
                                        )
                                      else if (rankController
                                              .userInfoRank.value['rank'] ==
                                          3)
                                        Image.asset(
                                          'assets/images/th_icon.png',
                                          width: 24.w,
                                          height: 24.w,
                                        )
                                      else
                                        Container(
                                          padding: EdgeInsets.only(left: 5.w),
                                          margin: EdgeInsets.only(right: 12.w),
                                          child: Text(
                                            '${rankController.userInfoRank.value['rank']}',
                                            style: TextStyle(
                                                color: Color(0xff000000),
                                                fontFamily: 'D-DIN-PRO',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      rankController.userInfoRank
                                                  .value['avatar'] ==
                                              null
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left: 9.w, right: 8.w),
                                              child: Image.asset(
                                                'assets/images/user_avatar.png',
                                                width: 40.w,
                                                height: 40.w,
                                              ),
                                            )
                                          :
                                          // Container(
                                          //     margin: EdgeInsets.only(
                                          //         left: 9.w, right: 8.w),
                                          //     child: SvgPicture.network(
                                          //       '${item['avatar']}',
                                          //       width: 40.w,
                                          //       height: 40.w,
                                          //     ),
                                          //   ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 9.w, right: 8.w),
                                              child: Image.asset(
                                                'assets/images/user_avatar.png',
                                                width: 40.w,
                                                height: 40.w,
                                              ),
                                            ),
                                      Text(
                                        rankController.userInfoRank
                                                .value['userName'] ??
                                            '',
                                        style: TextStyle(
                                            color: Color(0XFF000000),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 2.73.w),
                                        child: Image.network(
                                          '${rankController.userInfoRank.value['assetIcon']}',
                                          width: 14.55.w,
                                          height: 14.55.w,
                                        ),
                                      ),
                                      Text(
                                        '${formatNumber(rankController.userInfoRank.value['balance'].toString(), decimalPlaces: 2)}',
                                        style: TextStyle(
                                            color: Color(0XFF000000),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ));
                      } else {
                        return Container();
                      }
                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
