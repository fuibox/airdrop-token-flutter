// import 'package:airdrop_flutter/utils/fromNumber.dart';
// import 'package:flutter/material.dart';

// class AnimatedNumber extends StatefulWidget {
//   final dynamic endValue; // 目标值，类型可以是 String、int、double、num
//   final int durationInSeconds;
//   final int decimalPlaces;
//   final TextStyle textStyle; // 传入的 TextStyle

//   const AnimatedNumber({
//     Key? key,
//     required this.endValue,
//     this.durationInSeconds = 2,
//     this.decimalPlaces = 4,
//     required this.textStyle, // 接收 TextStyle
//   }) : super(key: key);

//   @override
//   _AnimatedNumberState createState() => _AnimatedNumberState();
// }

// class _AnimatedNumberState extends State<AnimatedNumber>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _controller; // 动画控制器
//   Animation<double>? _animation; // 动画
//   double _startValue = 0.0; // 初始值设置为 0

//   @override
//   void initState() {
//     super.initState();

//     // 只有在需要动画时才初始化 _controller
//     if (widget.endValue != null && widget.endValue != 0) {
//       widget.endValue.toString();
//       // 动画控制器
//       _controller = AnimationController(
//         duration: Duration(seconds: widget.durationInSeconds),
//         vsync: this,
//       );

//       // 动画的结束值
//       double end = 0.0;
//       if (widget.endValue is num) {
//         end = (widget.endValue as num).toDouble(); // 强制转换为 double
//       } else if (widget.endValue is String) {
//         end = (num.tryParse(widget.endValue) ?? 0.0).toDouble();
//       }

//       // 动画的范围
//       _animation = Tween<double>(
//         begin: _startValue,
//         end: end,
//       ).animate(_controller!)
//         ..addListener(() {
//           setState(() {});
//         });

//       // 开始动画
//       _controller!.forward();
//     }
//   }

//   @override
//   void dispose() {
//     // 只有在 _controller 被初始化时才调用 dispose
//     _controller?.dispose();
//     super.dispose();
//   }

//   // 格式化数字
//   String formatValue(double value) {
//     return formatNumber(value, decimalPlaces: widget.decimalPlaces);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 如果没有动画或者值为 0 或 null，直接显示 0
//     if (_animation == null || widget.endValue == null || widget.endValue == 0) {
//       return Text(
//         '\$${formatValue(0.0)}',
//         style: widget.textStyle, // 使用传入的 TextStyle
//       );
//     }

//     return Text(
//       '\$${formatValue(_animation!.value)}',
//       style: widget.textStyle, // 使用传入的 TextStyle
//     );
//   }
// }
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:flutter/material.dart';

class AnimatedNumber extends StatefulWidget {
  final dynamic endValue; // 目标值，类型可以是 String、int、double、num
  final int durationInSeconds;
  final int decimalPlaces;
  final TextStyle textStyle; // 传入的 TextStyle
  final bool showDollarSign; // 是否显示 $ 符号

  const AnimatedNumber({
    Key? key,
    required this.endValue,
    this.durationInSeconds = 2,
    this.decimalPlaces = 4,
    required this.textStyle, // 接收 TextStyle
    this.showDollarSign = true, // 默认显示 $
  }) : super(key: key);

  @override
  _AnimatedNumberState createState() => _AnimatedNumberState();
}

class _AnimatedNumberState extends State<AnimatedNumber>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller; // 动画控制器
  Animation<double>? _animation; // 动画
  double _startValue = 0.0; // 初始值设置为 0

  @override
  void initState() {
    super.initState();

    // 只有在需要动画时才初始化 _controller
    if (widget.endValue != null && widget.endValue != 0) {
      // 动画控制器
      _controller = AnimationController(
        duration: Duration(seconds: widget.durationInSeconds),
        vsync: this,
      );

      // 动画的结束值
      double end = 0.0;
      if (widget.endValue is num) {
        end = (widget.endValue as num).toDouble(); // 强制转换为 double
      } else if (widget.endValue is String) {
        end = (num.tryParse(widget.endValue) ?? 0.0).toDouble();
      }

      // 动画的范围
      _animation = Tween<double>(
        begin: _startValue,
        end: end,
      ).animate(_controller!)
        ..addListener(() {
          setState(() {});
        });

      // 开始动画
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    // 只有在 _controller 被初始化时才调用 dispose
    _controller?.dispose();
    super.dispose();
  }

  // 格式化数字
  String formatValue(double value) {
    return formatNumber(value, decimalPlaces: widget.decimalPlaces);
  }

  @override
  Widget build(BuildContext context) {
    // 如果没有动画或者值为 0 或 null，直接显示 0
    if (_animation == null || widget.endValue == null || widget.endValue == 0) {
      return Text(
        widget.showDollarSign ? '\$${formatValue(0.0)}' : formatValue(0.0),
        style: widget.textStyle, // 使用传入的 TextStyle
      );
    }

    return Text(
      widget.showDollarSign
          ? '\$${formatValue(_animation!.value)}'
          : formatValue(_animation!.value),
      style: widget.textStyle, // 使用传入的 TextStyle
    );
  }
}
