import 'dart:ui';

import 'package:airdrop_flutter/widgets/top_nav.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

class GoldenTreasureScreen extends StatefulWidget {
  const GoldenTreasureScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GoldenTreasure();
}

class _GoldenTreasure extends State<GoldenTreasureScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ScrollController sc = ScrollController();

  final Rules = [
    "I. The platform will periodically open the Win Big Prize event. ",
    "II. Participation can be done using \$ ADT. ",
    "III. Individual users can participate multiple times. ",
    "IV. The draw will take place after the event ends or once the number of participants reaches the required threshold. ",
    "V. A lucky player will be randomly selected from the proof of game entries. ",
    "VI. The lucky player will receive the reward for this Win Big Prize event.",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.builder(
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
        childBuilder: (context, physics) {
          return ScrollConfiguration(
              behavior: const ERScrollBehavior(),
              child: ExtendedNestedScrollView(
                physics: physics,
                onlyOneScrollInBody: true,
                controller: sc,
                pinnedHeaderSliverHeightBuilder: () {
                  return MediaQuery.of(context).padding.top +
                      kToolbarHeight +
                      148.w;
                },
                headerSliverBuilder: (BuildContext c, bool f) {
                  return <Widget>[
                    SliverAppBar(
                      centerTitle: false,
                      title: Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: const UserLoginBar(
                          showLogo: false,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(148.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 148.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/win-big-prize-banner.png",
                                    ),
                                  ),
                                ),
                                child: UnconstrainedBox(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 140.w,
                                    padding: EdgeInsets.only(left: 21.w),
                                    child: Text(
                                      "Win Big Prize".tr,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontFamily: "Figtree",
                                        fontWeight: FontWeight.w900,
                                        fontSize: 32.sp,
                                        color: Colors.white,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      iconTheme: const IconThemeData(color: Colors.white),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                          'assets/images/halo_bg.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/halo_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        dividerHeight: 0,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Figtree",
                          fontSize: 16.sp,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 0.6),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Figtree",
                          fontSize: 16.sp,
                        ),
                        indicator: BoxDecoration(
                          // color: Color.fromRGBO(229, 176, 69, 1),
                          border: Border(
                            bottom: BorderSide(
                              color: const Color.fromRGBO(229, 176, 69, 1),
                              width: 4.w,
                            ),
                          ),
                        ),
                        tabs: const <Widget>[
                          Tab(
                            text: 'Live',
                          ),
                          Tab(
                            text: 'Ended',
                          ),
                          Tab(
                            text: 'Rules',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ExtendedVisibilityDetector(
                              uniqueKey: const Key('Live'),
                              child: ListView.builder(
                                //store Page state
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.w,
                                ),
                                key: const PageStorageKey<String>('Live'),
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (BuildContext c, int i) {
                                  return BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 12.w, sigmaY: 12.w),
                                    child: Container(
                                      height: 246.w,
                                      // padding: EdgeInsets.symmetric(
                                      //   horizontal: 12.w,
                                      // ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.w),
                                        ),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(61, 54, 64, 1),
                                            Color.fromRGBO(77, 61, 38, 1),
                                          ],
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 73.w,
                                                  height: 20.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(16.w),
                                                      bottomRight:
                                                          Radius.circular(10.w),
                                                    ),
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color.fromRGBO(
                                                            251, 128, 31, 1),
                                                        Color.fromRGBO(
                                                            209, 103, 229, 1),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "MEME快闪",
                                                      style: TextStyle(
                                                        fontFamily: 'Figtree',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10.w,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text("#000201",
                                                    style: TextStyle(
                                                        fontFamily: ""))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.w,
                                            ),
                                            // color: Colors.red,
                                            child: Column(),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 1,
                              ),
                            ),
                            ExtendedVisibilityDetector(
                              uniqueKey: const Key('Ended'),
                              child: ListView.builder(
                                //store Page state
                                key: const PageStorageKey<String>('Ended'),
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (BuildContext c, int i) {
                                  return Container(
                                    alignment: Alignment.center,
                                    height: 60.0,
                                    child: Text(const Key('Ended').toString() +
                                        ': ListView$i'),
                                  );
                                },
                                itemCount: 50,
                              ),
                            ),
                            ExtendedVisibilityDetector(
                              uniqueKey: const Key('Rules'),
                              child: Container(
                                // color: Color.fromRGBO(230, 235, 242, 1),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 36.w,
                                  vertical: 36.w,
                                ),
                                child: Column(
                                  spacing: 12.w,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 12.w,
                                      ),
                                      child: Text(
                                        "Rules explanation",
                                        style: TextStyle(
                                          fontFamily: "Figtree",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    for (int i = 0; i < Rules.length; i++)
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          Rules[i],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: "Figtree",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  static bool _isBottomVisible = true;

  static void _scrollListener() {
    if (ScrollController().offset > 148.w) {
      if (_isBottomVisible) {
        _isBottomVisible = false;
      }
    } else {
      if (!_isBottomVisible) {
        _isBottomVisible = true;
      }
    }
  }
}

class _AutomaticKeepAlive extends StatefulWidget {
  final Widget child;

  const _AutomaticKeepAlive({
    required this.child,
  });

  @override
  State<_AutomaticKeepAlive> createState() => _AutomaticKeepAliveState();
}

class _AutomaticKeepAliveState extends State<_AutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
