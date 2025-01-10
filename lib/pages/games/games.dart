import 'package:airdrop_flutter/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GamesScreen extends StatefulWidget {
  GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  void gotoGoldenTreasure() {
    Get.toNamed(AppPages.goldenTreasure);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/halo_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // width: double.infinity,
              height: 223.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/game_banner.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 24.w,
            ),
            Row(
              spacing: 4.w,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/application.svg",
                  width: 24.w,
                  height: 24.w,
                ),
                Text(
                  "Application".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.w,
            ),
            Row(
              spacing: 20.w,
              children: [
                InkWell(
                  onTap: gotoGoldenTreasure,
                  child: Container(
                    width: 96.w,
                    height: 96.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.w),
                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/WinBigPrize.jpg"),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Image(
                            width: 48.w,
                            height: 24.w,
                            image: const AssetImage("assets/images/new.png"),
                          ),
                        ),
                        Positioned(
                            left: 12.w,
                            bottom: 12.w,
                            child: Text(
                              "Win Big Prize".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  shadows: const [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 0.0,
                                      color: Colors.black,
                                    ),
                                  ]),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 96.w,
                  height: 96.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.w),
                    ),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/UltimateEscape.jpg"),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image(
                          width: 48.w,
                          height: 24.w,
                          image: const AssetImage("assets/images/hot.png"),
                        ),
                      ),
                      Positioned(
                        left: 24.w,
                        bottom: 3.w,
                        child: SizedBox(
                          width: 48.w,
                          child: Text(
                            "Ultimate Escape".tr,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.white,
                                shadows: const [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 0.0,
                                    color: Colors.black,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 96.w,
                  height: 96.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.w),
                    ),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/GoldenTreasure.jpg"),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 24.w,
                        bottom: 3.w,
                        child: SizedBox(
                          width: 48.w,
                          child: Text(
                            "Golden Treasure".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.white,
                                shadows: const [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 0.0,
                                    color: Colors.black,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
