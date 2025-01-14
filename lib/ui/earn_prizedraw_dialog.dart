import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlipCardWidget extends StatefulWidget {
  final bool isSingle; // 是否为单张卡片模式
  final int rows; // 多张卡片时的行数

  const FlipCardWidget({
    Key? key,
    required this.isSingle,
    this.rows = 1,
  }) : super(key: key);

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;
  bool _isBackVisible = true; // 初始显示背面

  @override
  void initState() {
    super.initState();

    // 初始化动画
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // 翻转动画持续时间
      vsync: this,
    );

    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // 开始动画
    _startFlipAnimation();
  }

  void _startFlipAnimation() async {
    await _controller.forward(); // 从背面翻转到正面
    setState(() {
      _isBackVisible = false; // 停止翻转
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.isSingle
          ? _buildCard() // 单张模式
          : _buildGrid(), // 多张模式
    );
  }

  Widget _buildCard() {
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
                    transform: Matrix4.identity()
                      ..rotateY(3.1415926535897932), // 修正正面
                    child: Container(
                      width: 158.w,
                      height: 210.w,
                      padding: EdgeInsets.only(top: 9.w),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/earn_card_smbg.png'),
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/rau_logo.png',
                            width: 80.w,
                            height: 80.w,
                          ),
                          Container(
                            width: 160.w,
                            child: Text(
                              'Project 1 sent you an airdrop.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Figtree',
                                  fontSize: 14.sp,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.w),
                            child: Text(
                              'Received',
                              style: TextStyle(
                                  fontFamily: 'Figtree',
                                  fontSize: 12.sp,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/adt_token.png',
                                width: 20.w,
                                height: 20.w,
                              ),
                              Text(
                                '22.23232',
                                style: TextStyle(
                                    fontFamily: 'D-DIN-PRO',
                                    fontSize: 18.sp,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w700),
                              )
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
                        alignment: Alignment.center,
                      ),
                    ),
                    child: Column(
                      children: [],
                    ),
                  ));
      },
    );
  }

  Widget _buildGrid() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 48.w),
          child: SizedBox(
            height: 670.w,
            child: GridView.builder(
              padding: EdgeInsets.only(top: 0.w, left: 20.w, right: 20.w),
              shrinkWrap: true,
              itemCount: widget.rows * 2, // 每行显示两张卡
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 每行两张卡片
                mainAxisSpacing: 20.w,
                crossAxisSpacing: 20.w,
                childAspectRatio: 158.w / 210.w, // 卡片宽高比
              ),
              itemBuilder: (context, index) => _buildCard(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.w),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  SmartDialog.dismiss();
                },
                child: Container(
                    width: 138.w,
                    height: 44.w,
                    margin: EdgeInsets.only(right: 19.w),
                    decoration: BoxDecoration(
                        color: Color(0XFFD99B21),
                        borderRadius: BorderRadius.circular(8.r),
                        border:
                            Border.all(width: 1.w, color: Color(0XFF000000))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border(
                              top: BorderSide(
                                  width: 1.w, color: Color(0XFFFEFFD1)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Accept Now',
                            style: TextStyle(
                                color: Color(0XFF000000),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    width: 138.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0XFFFB801F), Color(0XFFD167E5)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                        border:
                            Border.all(width: 1.w, color: Color(0XFF000000))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border(
                              top: BorderSide(
                                  width: 1.w, color: Color(0XFFFEFFD1)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Share Group',
                            style: TextStyle(
                                color: Color(0XFF000000),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
