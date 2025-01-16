import 'dart:async';
import 'dart:ffi';
import 'dart:ui';
import 'dart:math' as math;

import 'package:airdrop_flutter/controllers/login_controller.dart';
import 'package:airdrop_flutter/models/assets.dart';
import 'package:airdrop_flutter/models/wbpactivity.dart';
import 'package:airdrop_flutter/pages/friends/icon.dart';
import 'package:airdrop_flutter/pages/golden-treasure/count_down.dart';
import 'package:airdrop_flutter/pages/golden-treasure/ticket_dialog.dart';
import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/service/api_games_service.dart';
import 'package:airdrop_flutter/service/api_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/widgets/top_nav.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:intl/intl.dart';

class GoldenTreasureScreen extends StatefulWidget {
  const GoldenTreasureScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GoldenTreasure();
}

class _GoldenTreasure extends State<GoldenTreasureScreen>
    with SingleTickerProviderStateMixin {
  final storage = Get.find<StorageService>();
  late EasyRefreshController _controller;
  late ScrollController _sc;
  late final TabController _tabController;
  LoginController loginController = Get.put(LoginController());
  int tabIndex = 0;
  bool initial = false;

  final exampleData = Wbpactivity(
      activityId: 976393,
      activityTitle: "2000 ADT",
      activityLogo: "https://airdrop-static.jyczg888.uk/wbp/adt-bg.png",
      awardAssetId: 1,
      awardAssetName: "ADT",
      awardAssetIcon:
          "https://airdrop-static.jyczg888.uk/assets/adt.png?v=1.0.0",
      awardIconLogo:
          "https://airdrop-static.jyczg888.uk/assets/adt.png?v=1.0.0",
      awardAmount: "2000.00000000",
      curJoin: 0,
      maxJoin: 10,
      buyLimit: 10,
      startUtcTime: 1737023400000,
      endUtcTime: 1737024000000,
      assetId: 1,
      assetIcon: "https://airdrop-static.jyczg888.uk/assets/adt.png?v=1.0.0",
      assetExpense: "5.00000000",
      winTgId: null,
      winNumber: null,
      isPickup: false,
      isMeme: false,
      type: "",
      isEnd: false,
      buyAmount: 0);

  static const LiveKey = Key('Live');
  static const EndedKey = Key('Ended');
  static const MyKey = Key('My');
  static const RuleKey = Key('Rules');

  final Rules = [
    "I. The platform will periodically open the Win Big Prize event. ",
    "II. Participation can be done using \$ ADT. ",
    "III. Individual users can participate multiple times. ",
    "IV. The draw will take place after the event ends or once the number of participants reaches the required threshold. ",
    "V. A lucky player will be randomly selected from the proof of game entries. ",
    "VI. The lucky player will receive the reward for this Win Big Prize event.",
  ];

  late List<Wbpactivity> liveList = [];
  late List<Wbpactivity> endedList = [];
  late List<Wbpactivity> myList = [];
  String url = "";

  bool hasRefreshed = false;

  Future<void> UserAssetList() async {
    try {
      final response = await userAssetsService.UserAssetList();
      if (response.statusCode == 200) {
        AssetsModel assetsData = AssetsModel.fromJson(response.data);
        if (assetsData.code == 200) {
          final data =
              assetsData.data?.firstWhere((asset) => asset.name == 'ADT');

          if (data?.amount != "") {
            storage.updateBalance("ADT", double.parse(data!.amount!));
          }

          // setState(() {
          //   data = assetsData.data!.firstWhere((asset) => asset.name == 'ADT');
          // });
        }
      } else {}
    } catch (e) {
      print('asset/list：$e');
    }
  }

  void onRefresh() async {
    if (tabIndex == 0) {
      url = "wbpactivity/list?labelType=3&isJoinOnly=0";
    }
    if (tabIndex == 1) {
      url = "wbpactivity/list?labelType=2&isJoinOnly=0";
    }
    if (tabIndex == 2) {
      url = "wbpactivity/list?labelType=2&isJoinOnly=1";
    }
    if (tabIndex == 3) {
      _controller.finishRefresh();
      return;
    }
    try {
      await UserAssetList();
      final response = await dioService.getRequest(url + "&timestamp=0");

      if (response.statusCode == 200) {
        WbpactivityModel wbpactivityData =
            WbpactivityModel.fromJson(response.data as Map<String, dynamic>);

        if (wbpactivityData.code == 200) {
          setState(() {
            if (tabIndex == 0) {
              liveList = wbpactivityData.data;
            }
            if (tabIndex == 1) {
              endedList = wbpactivityData.data;
            }
            if (tabIndex == 2) {
              myList = wbpactivityData.data;
            }
          });
        }
      }
    } catch (e) {
      rethrow;
    } finally {
      _controller.finishRefresh();
      hasRefreshed = false;
    }
  }

  void onLoad() async {
    try {
      List<Wbpactivity> list = [];
      if (tabIndex == 0) {
        list = liveList;
      }
      if (tabIndex == 1) {
        list = endedList;
      }
      if (tabIndex == 2) {
        list = myList;
      }
      final response = await dioService
          .getRequest("${url}&timestamp=${list[list.length - 1].startUtcTime}");

      if (response.statusCode == 200) {
        WbpactivityModel wbpactivityData =
            WbpactivityModel.fromJson(response.data as Map<String, dynamic>);

        if (wbpactivityData.code == 200) {
          setState(() {
            if (tabIndex == 0) {
              liveList = [
                ...liveList,
                ...wbpactivityData.data,
              ];
            }
            if (tabIndex == 1) {
              endedList = [
                ...endedList,
                ...wbpactivityData.data,
              ];
            }
            if (tabIndex == 2) {
              myList = [
                ...myList,
                ...wbpactivityData.data,
              ];
            }
          });
        }
      }
    } catch (e) {
      rethrow;
    } finally {
      _controller.finishLoad();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    _sc = ScrollController();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (!hasRefreshed && _tabController.index != 3) {
        _controller.callRefresh(
          scrollController: _sc,
        );
        hasRefreshed = true;
      }
      setState(() {
        tabIndex = _tabController.index;
      });
    });

    Future.delayed(Duration.zero, () {
      _controller.callRefresh(
        overOffset: 100.w,
        scrollController: _sc,
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.builder(
          controller: _controller,
          header: ClassicHeader(
            safeArea: true,
            clamping: true,
            position: IndicatorPosition.locator,
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Figtree',
              // fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            messageStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Figtree',
              // fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          footer: ClassicFooter(
            position: IndicatorPosition.locator,
            dragText: 'Pull to load'.tr,
            armedText: 'Release ready'.tr,
            readyText: 'Loading...'.tr,
            processingText: 'Loading...'.tr,
            processedText: 'Succeeded'.tr,
            noMoreText: 'No more'.tr,
            failedText: 'Failed'.tr,
            messageText: 'Last updated at %T'.tr,
            iconTheme: const IconThemeData(color: Colors.white),
            messageStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Figtree',
              // fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Figtree',
              // fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onRefresh: onRefresh,
          onLoad: onLoad,
          refreshOnStart: false,
          childBuilder: (context, physics) {
            return ScrollConfiguration(
              behavior: const ERScrollBehavior(),
              child: ExtendedNestedScrollView(
                controller: _sc,
                floatHeaderSlivers: true,
                physics: physics,
                // onlyOneScrollInBody: true,
                pinnedHeaderSliverHeightBuilder: () {
                  return MediaQuery.of(context).padding.top + kToolbarHeight;
                },

                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    const HeaderLocator.sliver(
                      clearExtent: false,
                    ),
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).padding.top +
                          kToolbarHeight +
                          148.w,
                      pinned: true,
                      centerTitle: false,
                      iconTheme: const IconThemeData(color: Colors.white),
                      actions: [
                        Container(
                          width: 225.w,
                          alignment: Alignment.centerRight,
                          child: UserLoginBar(
                            showLogo: false,
                            loginController: loginController,
                          ),
                        )
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          // height: 148.w,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                kToolbarHeight,
                          ),
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0,
                                child: Image(
                                  width: 343.w,
                                  // height: 158.w,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                  image: const AssetImage(
                                      "assets/images/win-big-prize-banner.png"),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 21.87.w,
                                child: UnconstrainedBox(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 131.84.w,
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
                              ),
                            ],
                          ),
                        ),
                        centerTitle: false,
                      ),
                    ),
                  ];
                },
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/halo_bg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            text: 'My',
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
                              uniqueKey: LiveKey,
                              child: _AutomaticKeepAlive(
                                child: CustomScrollView(
                                  physics: physics,
                                  slivers: [
                                    SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                            top: index == 0 ? 0 : 12.w,
                                            left: 16.w,
                                            right: 16.w,
                                          ),
                                          child: Skeletonizer(
                                              enabled: liveList.isEmpty,
                                              enableSwitchAnimation: true,
                                              // ignoreContainers: true,
                                              child: Card(
                                                controller: _controller,
                                                sc: _sc,
                                                loading: false,
                                                data: liveList.isEmpty
                                                    ? exampleData
                                                    : liveList[index],
                                              )),
                                        );
                                      },
                                      childCount: liveList.isEmpty
                                          ? 10
                                          : liveList.length,
                                    )),
                                    const FooterLocator.sliver(),
                                  ],
                                ),
                              ),
                            ),
                            ExtendedVisibilityDetector(
                              uniqueKey: EndedKey,
                              child: _AutomaticKeepAlive(
                                child: CustomScrollView(
                                  physics: physics,
                                  slivers: [
                                    SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                            top: index == 0 ? 0 : 12.w,
                                            left: 16.w,
                                            right: 16.w,
                                          ),
                                          child: Skeletonizer(
                                              enabled: endedList.isEmpty,
                                              // ignoreContainers: true,
                                              child: Card(
                                                controller: _controller,
                                                sc: _sc,
                                                loading: false,
                                                data: endedList.isEmpty
                                                    ? exampleData
                                                    : endedList[index],
                                              )),
                                        );
                                      },
                                      childCount: endedList.isEmpty
                                          ? 10
                                          : endedList.length,
                                    )),
                                    const FooterLocator.sliver(),
                                  ],
                                ),
                              ),
                            ),
                            ExtendedVisibilityDetector(
                              uniqueKey: MyKey,
                              child: _AutomaticKeepAlive(
                                child: CustomScrollView(
                                  physics: physics,
                                  slivers: [
                                    SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                            (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                          top: index == 0 ? 0 : 12.w,
                                          left: 16.w,
                                          right: 16.w,
                                        ),
                                        child: Skeletonizer(
                                            enabled: myList.isEmpty,
                                            // ignoreContainers: true,
                                            child: Card(
                                              controller: _controller,
                                              sc: _sc,
                                              loading: false,
                                              data: myList.isEmpty
                                                  ? exampleData
                                                  : myList[index],
                                            )),
                                      );
                                    },
                                            childCount: myList.isEmpty
                                                ? 10
                                                : myList.length)),
                                    const FooterLocator.sliver(),
                                  ],
                                ),
                              ),
                            ),
                            ExtendedVisibilityDetector(
                              uniqueKey: RuleKey,
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
              ),
            );
          }),
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

class Card extends StatefulWidget {
  final bool loading; // 新增 loading 属性
  final Wbpactivity data;
  final EasyRefreshController controller;
  final ScrollController sc;
  final Bool? skeletonizer;

  const Card({
    super.key,
    required this.loading,
    required this.data,
    required this.controller,
    required this.sc,
    this.skeletonizer,
  });

  @override
  State<StatefulWidget> createState() => _CardState();
}

class _CardState extends State<Card> with SingleTickerProviderStateMixin {
  final gameService = GameService();
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _heightAnimation;
  late Timer countdownTimer;
  bool isExpanded = false;
  bool isStart = false;
  bool isEnd = false;
  final formatter = NumberFormat('#,##0.##');
  late List<dynamic> proof = [];

  void toggleAnimation() {
    if (isExpanded) {
      _controller.reverse();
    } else {
      queryProof();
      _controller.forward();
    }
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void onParticipate() async {
    if (!isStart || isEnd) return;
    final result = await Get.bottomSheet(
      TicketDialog(
        data: widget.data,
      ),
      isScrollControlled: true,
      // isDismissible: false,
    );

    if (result == 'closed') {
      widget.controller.callRefresh(
        scrollController: widget.sc,
      );
    }
  }

  void queryProof() async {
    if (widget.data.buyAmount <= 0) return;
    final response =
        await gameService.QueryProof(widget.data.activityId.toString());

    if (response.statusCode == 200) {
      if (response.data['code'] == 200) {
        final data = response.data["data"];

        setState(() {
          proof = data;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutExpo,
      ),
    );

    _heightAnimation =
        Tween<double>(begin: 0, end: widget.data.buyAmount <= 0 ? 54.w : 108.w)
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutExpo,
      ),
    );

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final data = widget.data;

      setState(() {
        isStart =
            data.startUtcTime - DateTime.now().millisecondsSinceEpoch <= 0;

        isEnd = data.endUtcTime - DateTime.now().millisecondsSinceEpoch < 0;
      });
    });
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   queryProof();
  // }

  @override
  void dispose() {
    countdownTimer.cancel();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final isMax = data.curJoin == data.maxJoin;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.w, sigmaY: 12.w),
        child: Container(
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
                right: 12.w,
                top: 0,
                height: 26.w,
                child: Row(
                  mainAxisAlignment: data.isMeme
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data.isMeme)
                      Container(
                        width: 73.w,
                        height: 20.w,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.w),
                            bottomRight: Radius.circular(10.w),
                          ),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(251, 128, 31, 1),
                              Color.fromRGBO(209, 103, 229, 1),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "MEME快闪",
                            style: TextStyle(
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "#${data.activityId}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          fontFamily: "Figtree",
                          color: const Color.fromRGBO(255, 255, 255, 0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 30.w,
                  bottom: 16.w,
                ),
                // color: Colors.red,
                child: Column(
                  spacing: 8.w,
                  children: [
                    Row(
                      spacing: 12.w,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            width: 80.w,
                            height: 80.w,
                            image: NetworkImage("${data?.activityLogo ?? ""}"),
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 80.w,
                                height: 80.w,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            spacing: 4.w,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(data.activityTitle,
                                      style: TextStyle(
                                        fontFamily: "D-DIN-PRO",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    widget.data.buyAmount <= 0
                                        ? "Not participating"
                                        : "Participated",
                                    style: TextStyle(
                                      color:
                                          const Color.fromRGBO(229, 176, 69, 1),
                                      fontSize: 12.sp,
                                      fontFamily: "Figtree",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                spacing: 4.w,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 4.w,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.w)),
                                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                                    ),
                                    child: LayoutBuilder(
                                        builder: (context, constraints) {
                                      final w = constraints.minWidth *
                                          (data.curJoin / data.maxJoin);
                                      return UnconstrainedBox(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: w,
                                          height: 4.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.w)),
                                            color: const Color.fromRGBO(
                                                229, 176, 69, 1),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  Text(
                                    "${data.curJoin}/${data.maxJoin}",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "D-DIN-PRO",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      !isStart ? "Starts: " : "Ends: ",
                                      style: TextStyle(
                                        fontFamily: 'Figtree',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Countdown(
                                      timestamp: isStart
                                          ? data.startUtcTime
                                          : data.endUtcTime,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromRGBO(255, 255, 255, 0.05),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ticket",
                              style: TextStyle(
                                fontFamily: "Figtree",
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            AdtIcon(
                              value: formatter
                                  .format(double.parse(data.assetExpense)),
                              color: Colors.white,
                            )
                          ],
                        ),
                        Row(
                          spacing: 12.w,
                          children: [
                            InkWell(
                              onTap: onParticipate,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.w),
                                  ),
                                ),
                                child: Container(
                                  width: 138.w,
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
                                    gradient: LinearGradient(
                                      colors: (!isStart || isEnd || isMax)
                                          ? [
                                              const Color.fromRGBO(
                                                  207, 212, 229, 1),
                                              const Color.fromRGBO(
                                                  188, 192, 204, 1)
                                            ]
                                          : [
                                              const Color.fromRGBO(
                                                  229, 175, 69, 1),
                                              const Color.fromRGBO(
                                                  217, 155, 33, 1)
                                            ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Participate Now",
                                      style: TextStyle(
                                        color: (!isStart || isEnd)
                                            ? const Color.fromRGBO(
                                                97, 105, 115, 1)
                                            : Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp,
                                        fontFamily: 'Figtree',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (!widget.loading && isStart && !isEnd)
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.w),
                                  ),
                                ),
                                child: Container(
                                  width: 44.w,
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
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(207, 212, 229, 1),
                                        Color.fromRGBO(188, 192, 204, 1)
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/svg/share.svg",
                                      width: 24.w,
                                      height: 24.w,
                                    ),
                                  ),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      color: Color.fromRGBO(255, 255, 255, 0.05),
                    ),
                    InkWell(
                      onTap: toggleAnimation,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 4.w,
                            children: [
                              Image(
                                width: 24.w,
                                height: 24.w,
                                image: const AssetImage(
                                    "assets/images/coupon.png"),
                              ),
                              Text(
                                "Your Proof Of Game",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  fontFamily: 'Figtree',
                                ),
                              ),
                              Text(
                                "(${widget.data.buyAmount})",
                                style: TextStyle(
                                  color: const Color.fromRGBO(252, 119, 0, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  fontFamily: 'D-DIN-PRO',
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 18.w,
                            height: 18.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.w)),
                                border: Border.all(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.3),
                                  width: 1.5.w,
                                )),
                            child: Center(
                              child: AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle: _animation.value,
                                    child: child,
                                  );
                                },
                                child: Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                  size: 15.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _heightAnimation,
                      builder: (context, child) {
                        return Container(
                          width: double.infinity,
                          height: _heightAnimation.value,
                          margin: EdgeInsets.only(top: 6.w),
                          child: child,
                        );
                      },
                      child: SingleChildScrollView(
                        child: widget.data.buyAmount <= 0
                            ? Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/proof-null.svg",
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                  Text(
                                    "No proof".tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(255, 255, 255, 0.6),
                                    ),
                                  )
                                ],
                              )
                            : Wrap(
                                spacing: 17.5.w,
                                runSpacing: 12.w,
                                children: List.generate(
                                  proof.isEmpty
                                      ? widget.data.buyAmount
                                      : proof.length,
                                  (index) => Skeletonizer(
                                    enabled: proof.isEmpty,
                                    child: Container(
                                      width: 48.w,
                                      height: 28.w,
                                      child: proof.isEmpty
                                          ? const Text("")
                                          : Stack(
                                              children: [
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  left: 0,
                                                  child: SvgPicture.asset(
                                                      "assets/svg/proof-number.svg"),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  left: 0,
                                                  child: Center(
                                                    child: Text(
                                                      proof.isEmpty
                                                          ? ""
                                                          : proof[index]
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "D-DIN-PRO",
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
