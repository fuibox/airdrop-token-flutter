import 'package:airdrop_flutter/pages/home/home_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import 'package:marquee/marquee.dart';

class HomeAssetsCardScreen extends StatefulWidget {
  HomeAssetsCardScreen({Key? key}) : super(key: key);

  @override
  State<HomeAssetsCardScreen> createState() => _HomeAssetsCardScreenState();
}

class _HomeAssetsCardScreenState extends State<HomeAssetsCardScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    // 初始化 HomeController
    homeController = Get.put(HomeController());
    // 开始滚动
    // homeController.startScrolling();
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
                  Obx(
                    () {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // 横向滚动
                        child: Row(
                          children: [
                            for (int i = 0;
                                i < homeController.items.length;
                                i++)
                              Transform.translate(
                                offset: Offset(homeController.offsetX.value, 0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 217.w,
                                  height: 22.w,
                                  margin: EdgeInsets.only(
                                      bottom: 24.w, top: 12.w, right: 8.w),
                                  decoration: BoxDecoration(
                                    color: Color(0X33FFFFFF),
                                    borderRadius: BorderRadius.circular(66.r),
                                  ),
                                  child: Text(
                                    homeController.items[i],
                                    style: TextStyle(
                                        color: Color(0X55FFFFFF),
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),

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
                            Text(
                              '\$9,999.99999',
                              style: TextStyle(
                                  color: Color(0xFF141414),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w900),
                            ),
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
                                  Text(
                                    '102.0201',
                                    style: TextStyle(
                                        color: Color(0xFFEBB946),
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w900),
                                  )
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
                                        Text(
                                          '29384.94823',
                                          style: TextStyle(
                                              color: Color(0xFFEBB946),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w900),
                                        )
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
                                        Container(
                                          child: Text(
                                            '1000+',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w900),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 2.w),
                                          child: Image.asset(
                                            'assets/images/adt_icon.png',
                                            width: 20.w,
                                            height: 20.w,
                                          ),
                                        ),
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
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 309.w,
                                height: 39.w,
                                margin: EdgeInsets.only(bottom: 12.w),
                                decoration: BoxDecoration(
                                  color: Color(0XFFD99B21),
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFFFEFFD1),
                                      offset: Offset(0, -3),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 2.w),
                                      child: Text(
                                        'Earn more',
                                        style: TextStyle(
                                            color: Color(0XFF000000),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w900),
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
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33FFFFFF),
                          offset: Offset(0, -3),
                          blurRadius: 2,
                        ),
                      ],
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
                                height: 56.w,
                                child: Image.asset(
                                  'assets/images/user_avatar.png',
                                ),
                              ),

                              Container(
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
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: Color(0XFFFFDF80),
                                    width: 2.w,
                                  ),
                                ),
                                child: Text(
                                  'LV.6',
                                  style: TextStyle(
                                    color: Color(0XFF733A11),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
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
                                Text(
                                  'Felix',
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 14.sp),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 9.w),
                                  child: Text(
                                    'Wallet:',
                                    style: TextStyle(
                                        color: Color(0X66FFFFFF),
                                        fontSize: 14.sp),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 4.w),
                                  child: Text(
                                    '12312312312',
                                    style: TextStyle(
                                        color: Color(0XFFFFFFFF),
                                        fontSize: 14.sp),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/home_icon_copy.png',
                                  width: 14.w,
                                  height: 14.w,
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
