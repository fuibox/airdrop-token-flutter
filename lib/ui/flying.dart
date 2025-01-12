import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlyingGif extends StatefulWidget {
  final String gifPath; // GIF 图片路径
  final Duration duration; // 动画持续时间

  const FlyingGif({
    Key? key,
    required this.gifPath,
    required this.duration,
  }) : super(key: key);

  @override
  _FlyingGifState createState() => _FlyingGifState();
}

class _FlyingGifState extends State<FlyingGif> {
  double _yPosition = 0.0; // 初始位置

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    // 开始动画，控制飞行动画
    Future.delayed(Duration.zero, () {
      setState(() {
        _yPosition = -200.0; // 结束位置，飞到屏幕上方
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.duration,
      bottom: _yPosition * MediaQuery.of(context).size.height, // 动画从屏幕底部飞到顶部
      left: 0,
      right: 0,
      child: Center(
        child: Image.network(
          widget.gifPath,
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}
