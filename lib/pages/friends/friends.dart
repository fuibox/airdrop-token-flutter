import 'dart:ui';

import 'package:airdrop_flutter/pages/friends/backdrop.dart';
import 'package:airdrop_flutter/pages/friends/bubble.dart';
import 'package:airdrop_flutter/pages/friends/icon.dart';
import 'package:airdrop_flutter/pages/friends/inviteLevel.dart';
import 'package:airdrop_flutter/service/api_service.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../service/type.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  UserInfo? userInfo;
  String code = '';
  late EasyRefreshController _controller;

  void onBind() async {
    if (code == '') return;

    try {
      Get.defaultDialog(
        title: "Loading...",
        content: const CircularProgressIndicator(),
        barrierDismissible: false,
      );
      dio.Response<dynamic> response =
          await dioService.getRequest("user/bind_invite?inviteCode=${code}");

      if (response.statusCode == 200) {
        Get.back();
        dynamic data = response.data;
        if (data['code'] != 200) {
          Get.snackbar(
            "Error",
            data['message'] ?? '',
            colorText: Colors.black,
            backgroundColor: const Color.fromRGBO(217, 155, 33, 1),
            barBlur: 1,
            overlayBlur: 1,
          );
          return;
        } else {
          Get.snackbar(
            "Bind",
            "Invite code bind Successfully!",
            colorText: Colors.black,
            backgroundColor: const Color.fromRGBO(217, 155, 33, 1),
            barBlur: 1,
            overlayBlur: 1,
          );
          _controller.callRefresh();
        }
      }
    } finally {}
  }

  void onCopy() {
    String url =
        "https://t.me/AirdropToken001TestBot/app?startapp=${userInfo?.inviteCode ?? ""}";
    FlutterClipboard.copy(url).then(
      (value) => Get.snackbar(
        "copied!",
        url,
        colorText: Colors.black,
        backgroundColor: const Color.fromRGBO(217, 155, 33, 1),
        barBlur: 1,
        overlayBlur: 1,
      ),
    );
  }

  void onRefresh() async {
    try {
      final response = await dioService.getRequest("user/info");

      if (response.statusCode == 200) {
        UserData userData =
            UserData.fromJson(response.data as Map<String, dynamic>);
        setState(() {
          userInfo = userData.data;
        });
      }
    } finally {
      _controller.finishRefresh();
      _controller.resetFooter();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasInviter = userInfo?.hasInviter == 1;
    final progress = (userInfo?.inviteCount ?? 0.toDouble()) / 100;

    return EasyRefresh(
      controller: _controller,
      refreshOnStart: true,
      // refreshOnStartHeader: BuilderHeader(
      //   triggerOffset: 70,
      //   clamping: true,
      //   position: IndicatorPosition.above,
      //   processedDuration: Duration.zero,
      //   builder: (ctx, state) {
      //     if (state.mode == IndicatorMode.inactive ||
      //         state.mode == IndicatorMode.done) {
      //       return const SizedBox();
      //     }
      //     return Container(
      //       padding: const EdgeInsets.only(bottom: 100),
      //       width: double.infinity,
      //       height: state.viewportDimension,
      //       alignment: Alignment.center,
      //       child: SpinKitFadingCube(
      //         size: 24.w,
      //         // color: themeData.colorScheme.primary,
      //         color: Colors.white,
      //       ),
      //     );
      //   },
      // ),
      header: ClassicHeader(
        textStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Figtree',
          // fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        messageStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Figtree',
          // fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
      ),
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: hasInviter ? 750.w : 881.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/halo_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: 284.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/friend_banner.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 24.w),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Invite friends to earn more ".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 28.sp,
                                    color: Colors.white,
                                    shadows: const [
                                      BoxShadow(
                                        color: Color.fromARGB(
                                            115, 229, 178, 77), // #E5B24D73
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                      )
                                    ]),
                              ),
                              TextSpan(
                                text: "\$ADT",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 28.sp,
                                  color: const Color(0XFFE5B045),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color.fromARGB(
                                          115, 229, 178, 77), // #E5B24D73
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 280.w,
                    left: 16.w,
                    child: Column(
                      spacing: 12.w,
                      children: [
                        BoxBackdrop(
                          width: 343.w,
                          height: 104.w,
                          child: Row(
                            children: [
                              Container(
                                width: 72.w,
                                height: 72.w,
                                margin: EdgeInsets.only(right: 12.w),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/friend_basic_task.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 227.w,
                                child: Column(
                                  children: [
                                    Text(
                                      "Your friend must finish basic tasks for it to count."
                                          .tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 5.w,
                                    ),
                                    Row(
                                      children: [
                                        GiftIcon(
                                          value: "+1",
                                        ),
                                        Container(
                                          width: 12.w,
                                        ),
                                        AdtIcon(
                                          value: "+100",
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        BoxBackdrop(
                          width: 343.w,
                          height: 273.w,
                          child: Column(
                            children: [
                              Text(
                                'Accumulate a certain number of invites toget daily raffle entries. and increase theinvitation level.'
                                    .tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 16.w,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BubbleWidget(
                                    68.w,
                                    88.w,
                                    const Color.fromRGBO(0, 0, 0, 0.25),
                                    BubbleArrowDirection.bottom,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Daily Gain".tr,
                                          style: TextStyle(
                                            fontFamily: 'Figtree',
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.65),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            height: 0,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 12.w),
                                          child: GiftIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+1",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.w),
                                          child: AdtIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+100",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BubbleWidget(
                                    68.w,
                                    88.w,
                                    const Color.fromRGBO(0, 0, 0, 0.25),
                                    BubbleArrowDirection.bottom,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Daily Gain".tr,
                                          style: TextStyle(
                                            fontFamily: 'Figtree',
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.65),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            height: 0,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 12.w),
                                          child: GiftIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+1",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.w),
                                          child: AdtIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+100",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BubbleWidget(
                                    68.w,
                                    88.w,
                                    const Color.fromRGBO(0, 0, 0, 0.25),
                                    BubbleArrowDirection.bottom,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Daily Gain".tr,
                                          style: TextStyle(
                                            fontFamily: 'Figtree',
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.65),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            height: 0,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 12.w),
                                          child: GiftIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+1",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.w),
                                          child: AdtIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+100",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BubbleWidget(
                                    68.w,
                                    88.w,
                                    const Color.fromRGBO(0, 0, 0, 0.25),
                                    BubbleArrowDirection.bottom,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Daily Gain".tr,
                                          style: TextStyle(
                                            fontFamily: 'Figtree',
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.65),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            height: 0,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 12.w),
                                          child: GiftIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+1",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.w),
                                          child: AdtIcon(
                                            imgWidth: 16.w,
                                            imgHeight: 16.w,
                                            value: "+100",
                                            textStyle: TextStyle(
                                              fontFamily: "D-DIN-PRO",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              height: 0,
                                              color: const Color.fromRGBO(
                                                  229, 176, 69, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Positioned(
                                    top: 6.w,
                                    child: Container(
                                      height: 8.w,
                                      width: 310.w,
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 0.45),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4.w),
                                        ),
                                      ),
                                      child: UnconstrainedBox(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: 4.w,
                                          width: (310 * progress).w,
                                          margin: EdgeInsets.only(
                                            left: 2.w,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.w),
                                            ),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(178, 121, 68, 1),
                                                Color.fromRGBO(230, 178, 78, 1),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InviteLevel(
                                          value: "Lv.2",
                                          count: "5",
                                        ),
                                        InviteLevel(
                                          value: "Lv.3",
                                          count: "10",
                                        ),
                                        InviteLevel(
                                          value: "Lv.4",
                                          count: "30",
                                        ),
                                        InviteLevel(
                                          value: "Lv.5",
                                          count: "100",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        if (!hasInviter)
                          BoxBackdrop(
                            width: 343.w,
                            height: 120.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // spacing: 16.w,
                              children: [
                                Text(
                                  "My referrer".tr,
                                  style: TextStyle(
                                    fontFamily: "Figtree",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.w,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        suffixIcon: Container(
                                          margin: EdgeInsets.only(
                                            right: 4.w,
                                          ),
                                          child: InkWell(
                                            onTap: onBind,
                                            child: Container(
                                              width: 80.w,
                                              height: 44.w,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                    color: const Color.fromRGBO(
                                                        254, 255, 209, 0.65),
                                                    width: 2.w,
                                                  ),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8.w),
                                                ),
                                                // color: const Color.fromRGBO(255, 255, 255, 0.65),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color.fromRGBO(
                                                        229, 175, 69, 1),
                                                    Color.fromRGBO(
                                                        217, 155, 33, 1)
                                                  ],
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                // spacing: 4.w,
                                                children: [
                                                  GiftIcon(
                                                    imgHeight: 16.w,
                                                    imgWidth: 16.w,
                                                  ),
                                                  Text(
                                                    "Bind",
                                                    style: TextStyle(
                                                      fontFamily: "Figtree",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.w)),
                                          borderSide: BorderSide(
                                            width: 1.w,
                                            color: const Color.fromRGBO(
                                                227, 171, 62, 1),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.w)),
                                          borderSide: BorderSide(
                                            width: 1.w,
                                            color: const Color.fromRGBO(
                                                227, 171, 62, 1),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.w)),
                                          borderSide: BorderSide(
                                            width: 1.w,
                                            color: const Color.fromRGBO(
                                                227, 171, 62, 1),
                                          ),
                                        ),
                                        hintText: "Enter invitation code".tr,
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          fontFamily: "Figtree",
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.4),
                                        )),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    onChanged: (value) {
                                      code = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 10.w,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 44.w,
                                width: 285.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.w),
                                  ),
                                  border: Border(
                                    top: BorderSide(
                                      color: const Color.fromRGBO(
                                          254, 255, 209, 0.65),
                                      width: 2.w,
                                    ),
                                  ),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(229, 175, 69, 1),
                                      Color.fromRGBO(217, 155, 33, 1),
                                    ],
                                  ),
                                ),
                                child: const FlashButton(),
                                // child: Center(
                                //   child: Text(
                                //     "Invite Now",
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.w700,
                                //       color:
                                //           const Color.fromRGBO(20, 20, 20, 1),
                                //       fontSize: 16.sp,
                                //       fontFamily: 'Figtree',
                                //     ),
                                //   ),
                                // ),
                              ),
                            ),
                            InkWell(
                              onTap: onCopy,
                              child: Container(
                                width: 48.w,
                                height: 44.w,
                                decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 0.65),
                                        width: 2.w,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.w),
                                    ),
                                    // color: const Color.fromRGBO(255, 255, 255, 0.65),
                                    gradient: const LinearGradient(colors: [
                                      Color.fromRGBO(207, 212, 229, 1),
                                      Color.fromRGBO(188, 192, 204, 1)
                                    ])),
                                child: SvgPicture.asset(
                                  "assets/svg/copy.svg",
                                  width: 18.w,
                                  height: 18.w,
                                  fit: BoxFit.scaleDown,
                                ),
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
        ],
      ),
    );
  }
}

class FlashButton extends StatefulWidget {
  const FlashButton({super.key});

  @override
  State<FlashButton> createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(8.w),
            ),
            child: SizedBox(
              width: double.infinity,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_animation.value * 285.w, 0),
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/yellow-flash.png",
                        height: 44.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Text(
              "Invite Now",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(20, 20, 20, 1),
                fontSize: 16.sp,
                fontFamily: 'Figtree',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
