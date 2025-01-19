import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlipCardWidget extends StatefulWidget {
  final List<Map<String, dynamic>> assetList; // 动态卡片数据
  final bool isShowShare; // 是否显示分享按钮

  const FlipCardWidget({
    Key? key,
    required this.assetList,
    this.isShowShare = false,
  }) : super(key: key);

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSingle = widget.assetList.length == 1;

    return Center(
      child: Container(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 60.w, bottom: 30.w),
          // padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: isSingle
                        ? Center(child: _buildCard(widget.assetList[0]))
                        : _buildGrid(),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.w,
                left: 0,
                right: 0,
                child: _buildShareButton(),
              ),
            ],
          )),
    );
  }

  Widget _buildCard(Map<String, dynamic> data) {
    return AnimatedBuilder(
      animation: _flipAnimation,
      builder: (context, child) {
        final isFrontVisible = _flipAnimation.value > 0.5;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateY(_flipAnimation.value * 3.1415926535897932),
          child: isFrontVisible
              ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(3.1415926535897932),
                  child: Container(
                    width: 158.w,
                    height: 210.w,
                    padding: EdgeInsets.only(top: 9.w),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/earn_card_smbg.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          data['icon'],
                          width: 80.w,
                          height: 80.w,
                        ),
                        Container(
                          width: 160.w,
                          padding: EdgeInsets.only(top: 10.w),
                          child: Text(
                            '${data['sponsorName']} sent you an airdrop.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Figtree',
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          'Received',
                          style: TextStyle(
                            fontFamily: 'Figtree',
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              data['sponsorIcon'],
                              width: 20.w,
                              height: 20.w,
                            ),
                            Text(
                              ' ${data['amount']} ',
                              style: TextStyle(
                                fontFamily: 'D-DIN-PRO',
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${data['name']}',
                              style: TextStyle(
                                fontFamily: 'D-DIN-PRO',
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Container(
                  width: 158.w,
                  height: 210.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/earn_card_rev.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildGrid() {
    return Container(
      margin: EdgeInsets.only(bottom: 50.w),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 0.w),

        // shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(), // 允许滑动

        itemCount: widget.assetList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 20.w,
          childAspectRatio: 158.w / 210.w,
        ),
        itemBuilder: (context, index) => _buildCard(widget.assetList[index]),
      ),
    );
  }

  Widget _buildShareButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => SmartDialog.dismiss(),
            child: Container(
              width: 138.w,
              height: 44.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Accept Now',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          if (widget.isShowShare)
            InkWell(
              onTap: () => print('Share Group'),
              child: Container(
                width: 138.w,
                height: 44.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFB801F), Color(0xFFD167E5)],
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Share Group',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
