import 'package:airdrop_flutter/routes/app_pages.dart';
import 'package:airdrop_flutter/ui/assets_deposit_dialog.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import '../../controllers/ranking_controller.dart';

class HomeLeaderboardScreen extends StatefulWidget {
  HomeLeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<HomeLeaderboardScreen> createState() => _HomeLeaderboardScreenState();
}

class _HomeLeaderboardScreenState extends State<HomeLeaderboardScreen> {
  final RankingController controller = Get.put(RankingController());

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
                Container(
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
                                image: AssetImage('assets/images/two_bg.png'),
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
                              margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                              child: Text(
                                'TOP2',
                                style: TextStyle(
                                    color: Color(0XFFEBB946),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Text(
                              'DHSHU...',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF), fontSize: 12.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/adt_token.png',
                                  width: 12.7.w,
                                  height: 12.7.w,
                                ),
                                Text(
                                  '32,222,444',
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
                                image: AssetImage('assets/images/one_bg.png'),
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
                              margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                              child: Text(
                                'TOP1',
                                style: TextStyle(
                                    color: Color(0XFFEBB946),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Text(
                              'DHSHU...',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF), fontSize: 12.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/adt_token.png',
                                  width: 12.7.w,
                                  height: 12.7.w,
                                ),
                                Text(
                                  '32,222,444',
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
                                image:
                                    AssetImage('assets/images/ld_two_bg.png'),
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter)),
                        width: 100.w,
                        height: 189.w,
                        child: Column(
                          children: [
                            Container(
                              width: 100.w,
                              height: 88.w,
                              padding: EdgeInsets.only(top: 10.w, right: 2.w),
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
                              margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                              child: Text(
                                'TOP3',
                                style: TextStyle(
                                    color: Color(0XFFEBB946),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Text(
                              'DHSHU...',
                              style: TextStyle(
                                  color: Color(0XFFFFFFFF), fontSize: 12.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/adt_token.png',
                                  width: 12.7.w,
                                  height: 12.7.w,
                                ),
                                Text(
                                  '32,222,444',
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
                ),
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
                      controller.refreshData();
                    },
                    onLoad: () async {
                      // 加载更多
                      controller.loadMoreData();
                    },
                    child: Obx(() {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.rankingList.length,
                        itemBuilder: (context, index) {
                          // 渲染排名数据
                          return Container(
                            width: 334.w,
                            height: 65.w,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1.w,
                                        color:
                                            Color(0XFFFFFFFF).withAlpha(10)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/one_icon.png',
                                      width: 24.w,
                                      height: 24.w,
                                    ),
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
                                      controller.rankingList[index],
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
                                      margin: EdgeInsets.only(right: 2.73.w),
                                      child: Image.asset(
                                        'assets/images/adt_token.png',
                                        width: 14.55.w,
                                        height: 14.55.w,
                                      ),
                                    ),
                                    Text(
                                      '32,212,323',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
