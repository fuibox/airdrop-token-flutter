import 'package:airdrop_flutter/controllers/login_controller.dart';
import 'package:airdrop_flutter/controllers/user_assets.controller.dart';
import 'package:airdrop_flutter/pages/home/home_list.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/animtedNumber.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class HomeAssetsCardScreen extends StatefulWidget {
  HomeAssetsCardScreen({Key? key}) : super(key: key);

  @override
  State<HomeAssetsCardScreen> createState() => _HomeAssetsCardScreenState();
}

class _HomeAssetsCardScreenState extends State<HomeAssetsCardScreen> {
  HomeController homeController = Get.put(HomeController());
  UserAssetsController assetListController = Get.put(UserAssetsController());
  LoginController loginController = Get.put(LoginController());
  final storage = Get.find<StorageService>();

  @override
  void initState() {
    super.initState();
    loginController.UserConfig();
    AppLogger.instance.e(storage.userInfo);
    AppLogger.instance.e(storage.userWinner.value);
    AppLogger.instance.e(storage.prizePool.value['totalGemSupply']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 343.w,
                    height: 379.w,
                    padding: EdgeInsets.only(top: 0.w),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/home_card_bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        // assets
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/adt_icon.png',
                                    width: 18.w,
                                    height: 18.w,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 4.w),
                                    child: Text(
                                      'Prize Pool',
                                      style: TextStyle(
                                          color: Color(0xFF735211),
                                          fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Obx(() {
                              if (storage.prizePool.value.isEmpty) {
                                return Container(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                        color: Color(0xFF141414),
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                );
                              }
                              final usdt =
                                  storage.prizePool.value['totalUsdtValue'] ??
                                      0;
                              return AnimatedNumber(
                                endValue: usdt,
                                durationInSeconds: 3,
                                decimalPlaces: 4,
                                textStyle: TextStyle(
                                    color: Color(0xFF141414),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w900),
                              );
                            }),
                            Container(
                              width: 154.w,
                              height: 24.w,
                              decoration: BoxDecoration(
                                color: Color(0X33FFE6B24D), // 背景颜色
                                borderRadius: BorderRadius.circular(66.0), // 圆角
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 2.w),
                                    child: Text(
                                      'Pool composition',
                                      style: TextStyle(
                                          color: Color(0xFF402E0A),
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/home_btn_right.png',
                                    width: 8.w,
                                    height: 8.w,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        // card
                        Container(
                          margin: EdgeInsets.only(top: 8.w),
                          width: 339.w,
                          height: 276.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/home_asset_bg.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 12.w, bottom: 4.w),
                                child: Text(
                                  'My ADT',
                                  style: TextStyle(
                                      color: Color(0xFFEBB946),
                                      fontSize: 12.sp),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 2.w),
                                    child: Image.asset(
                                      'assets/images/adt_icon.png',
                                      width: 22.w,
                                      height: 22.w,
                                    ),
                                  ),
                                  Obx(() {
                                    // 检查列表是否为空
                                    if (storage.assetsList.value.isEmpty) {
                                      return Text(
                                        '0',
                                        style: TextStyle(
                                            color: Color(0xFFEBB946),
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w900),
                                      );
                                    }

                                    // 检查索引是否有效
                                    final amount = storage.assetsList.value[0]
                                            ['amount'] ??
                                        0;

                                    return AnimatedNumber(
                                      endValue: amount,
                                      durationInSeconds: 3,
                                      decimalPlaces: 2,
                                      textStyle: TextStyle(
                                          color: Color(0xFFEBB946),
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w900),
                                    );
                                  })
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8.w, bottom: 9.h),
                                width: 279.w,
                                height: 1.w,
                                color: Color(0x22FFFFFF),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8.w),
                                width: 279.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Circulating Supply',
                                      style: TextStyle(
                                          color: Color(0xFFEBB946),
                                          fontSize: 12.sp),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/adt_icon.png',
                                          width: 12.w,
                                          height: 12.w,
                                        ),
                                        Obx(() {
                                          if (storage.prizePool.value.isEmpty) {
                                            return Container();
                                          }
                                          final tatal = storage.prizePool
                                                  .value['totalGemSupply'] ??
                                              0;
                                          return AnimatedNumber(
                                            endValue: tatal,
                                            durationInSeconds: 3,
                                            decimalPlaces: 2,
                                            textStyle: TextStyle(
                                                color: Color(0xFFEBB946),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w900),
                                          );
                                        })
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 16.w),
                                width: 279.w,
                                height: 58.w,
                                padding:
                                    EdgeInsets.only(left: 16.w, right: 16.w),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/home_btn_bg.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            'My ranking',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                        Obx(() {
                                          return Container(
                                            child: Text(
                                              '${storage.userRank['rank'] ?? 0}+',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Color(0xFF000000),
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/ranking');
                                      },
                                      child: Row(
                                        children: [
                                          Obx(() {
                                            // 确保 storage.userRank 不是空，并且包含 'assetIcon'
                                            if (storage.userRank.isNotEmpty &&
                                                storage.userRank
                                                        .value['assetIcon'] !=
                                                    null) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 2.w),
                                                child: Image.network(
                                                  '${storage.userRank.value['assetIcon']}', // 确保访问实际值
                                                  width: 20.w,
                                                  height: 20.w,
                                                ),
                                              );
                                            } else {
                                              // 如果 userRank 为空或 assetIcon 不存在，返回一个占位文本
                                              return const Text('');
                                            }
                                          }),
                                          Text(
                                            'Ranking list',
                                            style: TextStyle(
                                                color: Color(0XFF000000),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Image.asset(
                                            'assets/images/home_btn_right.png',
                                            width: 12.w,
                                            height: 12.w,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  homeController.selectedIndex.value = 1;
                                },
                                child: Animate(
                                  autoPlay: true,
                                  onPlay: (controller) => controller.repeat(),
                                  effects: [
                                    ShimmerEffect(
                                      color: Color(0xffffdb26),
                                      duration: Duration(seconds: 2),
                                      angle: 0,
                                      curve: Curves.linear,
                                    ),
                                  ],
                                  child: Container(
                                    width: 309.w,
                                    height: 39.w,
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      color: Color(0XFFD99B21),
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border(
                                        top: BorderSide(
                                            width: 2.w,
                                            color: Color(0xFFFEFFD1)),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 2.w),
                                          child: Text(
                                            'Earn more',
                                            style: TextStyle(
                                              color: Color(0XFF000000),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/adt_icon.png',
                                          width: 14.w,
                                          height: 14.w,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Welcome to the AirDrop Coins world! Use ADT to participate in various activities and earn various rewards!',
                                  style: TextStyle(
                                      color: Color(0XFFEBB946),
                                      fontSize: 10.sp),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // 用户资料
                  Container(
                    width: 343.w,
                    height: 88.h,
                    margin: EdgeInsets.only(top: 12.w, bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Color(0XFF1F0B0E),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border(
                          top:
                              BorderSide(width: 2.w, color: Color(0x33FFFFFF))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16.w, right: 12.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // 头像
                              Container(
                                width: 56.w,
                                height: 65.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: AssetImage(
                                        'assets/images/user_avatar.png',
                                      ),
                                      fit: BoxFit.contain),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Obx(() {
                                      // 获取 inviteCount 值
                                      final inviteCount = storage
                                              .userInfo.value['inviteCount'] ??
                                          0;

                                      // 根据 inviteCount 值判断用户等级
                                      String userLevel;
                                      if (inviteCount < 5) {
                                        userLevel = "1";
                                      } else if (inviteCount < 15) {
                                        userLevel = "2";
                                      } else if (inviteCount < 50) {
                                        userLevel = "3";
                                      } else if (inviteCount < 100) {
                                        userLevel = "4";
                                      } else {
                                        userLevel = "5";
                                      }
                                      return Container(
                                        alignment: Alignment.center,
                                        width: 40.w,
                                        height: 16.w,
                                        decoration: BoxDecoration(
                                          color: Color(0XFFE5B450),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x33E5B450),
                                              offset: Offset(0, -3),
                                              blurRadius: 2,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          border: Border.all(
                                            color: Color(0XFFFFDF80),
                                            width: 2.w,
                                          ),
                                        ),
                                        child: Text(
                                          'LV.${userLevel}',
                                          style: TextStyle(
                                            color: Color(0XFF733A11),
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 9.w),
                                  child: Text(
                                    'Name:',
                                    style: TextStyle(
                                        color: Color(0X66FFFFFF),
                                        fontSize: 14.sp),
                                  ),
                                ),
                                Obx(() {
                                  return Text(
                                    '${storage.userInfo['nickName'] ?? ''}',
                                    style: TextStyle(
                                        color: Color(0XFFFFFFFF),
                                        fontSize: 14.sp),
                                  );
                                })
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 9.w),
                                  child: Text(
                                    'User ID:',
                                    style: TextStyle(
                                        color: Color(0X66FFFFFF),
                                        fontSize: 14.sp),
                                  ),
                                ),
                                Obx(() {
                                  return Container(
                                    margin: EdgeInsets.only(right: 4.w),
                                    child: Text(
                                      '${storage.userInfo.value['userId'] ?? ''}',
                                      style: TextStyle(
                                          color: Color(0XFFFFFFFF),
                                          fontSize: 14.sp),
                                    ),
                                  );
                                }),
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                        text:
                                            storage.userInfo.value['userId'] ??
                                                ''));
                                    SmartDialog.showToast('Copy SUCCESS',
                                        alignment: Alignment.center);
                                  },
                                  child: Image.asset(
                                    'assets/images/home_icon_copy.png',
                                    width: 14.w,
                                    height: 14.w,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // home_list
                  HomeListScreen()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
