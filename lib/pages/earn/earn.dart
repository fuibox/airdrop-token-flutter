import 'package:airdrop_flutter/controllers/earn_prizedraw_controller.dart';
import 'package:airdrop_flutter/controllers/home_controller.dart';
import 'package:airdrop_flutter/pages/earn/adt_application_zone.dart';
import 'package:airdrop_flutter/pages/earn/ecosystem.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/ui/earn_airdropbox.dialog.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class EarnScreen extends StatefulWidget {
  EarnScreen({Key? key}) : super(key: key);

  @override
  State<EarnScreen> createState() => _EarnScreenState();
}

class _EarnScreenState extends State<EarnScreen> {
  final storage = Get.find<StorageService>();
  final EarnPrizedrawController earnPrizedrawController =
      Get.put(EarnPrizedrawController());
  final HomeController homeController = Get.find();
  late AudioPlayer _audioPlayer;
  String musicBg = 'https://airdrop-static.jyczg888.uk/music/music.mp3';
  bool _isAudioPlaying = false; // 添加音频播放状态
  final spinkit = const SpinKitWave(
    color: Color(0xffffffff),
    size: 20,
  );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playNetworkAudio();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // 播放网络音频
  Future<void> _playNetworkAudio() async {
    try {
      // 确保音频没有被重复播放
      if (!_isAudioPlaying) {
        await _audioPlayer.setReleaseMode(ReleaseMode.loop); // 循环播放
        await _audioPlayer.play(
          UrlSource(musicBg),
        );
        setState(() {
          _isAudioPlaying = true;
        });
      }
    } catch (e) {
      print("Error playing audio: $e"); // 错误处理
    }
  }

  @override
  void dispose() {
    // 页面销毁时停止播放
    _audioPlayer.stop();
    _audioPlayer.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Prize draw
                  Container(
                      width: 343.w,
                      height: 340.w,
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.w, top: 23.w),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/earn_bg.png'),
                              fit: BoxFit.contain)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/earn_close.png',
                                width: 40.w,
                                height: 40.w,
                              ),
                              Container(
                                width: 92.w,
                                height: 87.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Color(0XFFFFFFFF).withOpacity(0.1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/nav_chest.png',
                                          width: 16.w,
                                          height: 16.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 2.w),
                                          child: Text(
                                            'Lucky draw',
                                            style: TextStyle(
                                                color: Color(0XFFFFFFFF),
                                                fontSize: 12.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                    Obx(() {
                                      return Container(
                                        child: Text(
                                          '${storage.userLottery.value['opportunity'] ?? 0}',
                                          style: TextStyle(
                                              color: Color(0XFFE5B045),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      );
                                    }),
                                    InkWell(
                                      onTap: () {
                                        homeController.selectedIndex.value = 2;
                                      },
                                      child: Container(
                                          width: 76.w,
                                          height: 28.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  width: 1.w,
                                                  color: Color(0XFF000000)),
                                              color: Color(0XFFE3B04C)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border(
                                                    top: BorderSide(
                                                        width: 1.w,
                                                        color: Color(
                                                            0XFFFEFFD1)))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Get more',
                                                  style: TextStyle(
                                                      color: Color(0XFF0D0900),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/earn_newbox.png',
                                width: 44.w,
                                height: 62.w,
                                opacity: const AlwaysStoppedAnimation(0),
                              ),
                              Obx(() {
                                if (earnPrizedrawController.imageUrl.isEmpty) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: 31.w, right: 31.w),
                                    width: 160.w,
                                    height: 160.w,
                                  );
                                } else {
                                  return Container(
                                      margin: EdgeInsets.only(
                                          left: 31.w, right: 31.w),
                                      child: Image.network(
                                        '${earnPrizedrawController.imageUrl}',
                                        width: 160.w,
                                        height: 160.w,
                                      ));
                                }
                              }),
                              InkWell(
                                onTap: () {
                                  if (storage.isLoggedIn.value) {
                                    showEarnAirdropBox();
                                  }
                                },
                                child: Container(
                                  height: 145.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        'assets/images/earn_newbox.png',
                                        width: 44.w,
                                        height: 62.w,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (storage.isLoggedIn.value &&
                                        storage.userLottery
                                                .value['opportunity'] >
                                            0) {
                                      earnPrizedrawController.UserLotteryDraw(
                                          '1');
                                    }
                                  },
                                  child: Container(
                                      width: 138.w,
                                      height: 44.w,
                                      margin: EdgeInsets.only(right: 19.w),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFD99B21),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          border: Border.all(
                                              width: 1.w,
                                              color: Color(0XFF000000))),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            border: Border(
                                                top: BorderSide(
                                                    width: 1.w,
                                                    color: Color(0XFFFEFFD1)))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            earnPrizedrawController
                                                    .drawOneState.value
                                                ? spinkit
                                                : Text(
                                                    'Draw 1 Time',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF000000),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                          ],
                                        ),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (storage.isLoggedIn.value &&
                                        storage.userLottery
                                                .value['opportunity'] >=
                                            10) {
                                      earnPrizedrawController.UserLotteryDraw(
                                          '10');
                                    }
                                  },
                                  child: Container(
                                      width: 138.w,
                                      height: 44.w,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0XFFFB801F),
                                              Color(0XFFD167E5)
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          border: Border.all(
                                              width: 1.w,
                                              color: Color(0XFF000000))),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            border: Border(
                                                top: BorderSide(
                                                    width: 1.w,
                                                    color: Color(0XFFFEFFD1)))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            earnPrizedrawController
                                                    .drawTwoState.value
                                                ? spinkit
                                                : Text(
                                                    'Draw 10 Time',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF000000),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            );
                          })
                        ],
                      )),

                  // ADT Application Zone
                  EarnAdtApplicationZone(),
                  // Ecosystem
                  EarnEcosystem()
                ],
              ),
            ),
          ),
          Obx(() {
            if (earnPrizedrawController.isAnimationComplete.isTrue) {
              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.network(
                  'https://airdrop-static.jyczg888.uk/web/lottery-plain.png',
                  width: 250.w,
                  height: 250.w,
                )
                    .animate()
                    .move(
                      begin: const Offset(0, 1),
                      end: Offset(0, -1000),
                      duration: Duration(seconds: 5),
                      curve: Curves.easeInOut,
                    )
                    .fadeOut(
                      duration: Duration(seconds: 3),
                      curve: Curves.easeInOut,
                    ),
              );
            } else {
              return SizedBox();
            }
          })
        ],
      ),
    );
  }
}
