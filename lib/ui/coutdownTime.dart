import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCountdownTimer extends StatelessWidget {
  final int endTime; // 倒计时结束的时间（毫秒）
  final TextStyle digitStyle; // 数字样式
  final TextStyle separatorStyle; // 冒号样式
  final double boxWidth; // 每个时间框的宽度
  final double boxHeight; // 每个时间框的高度

  CustomCountdownTimer({
    required this.endTime,
    required this.digitStyle,
    required this.separatorStyle,
    this.boxWidth = 28,
    this.boxHeight = 28,
  });

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: endTime,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) return Container();

        // 获取倒计时的小时、分钟、秒数
        String hours = time.hours?.toString().padLeft(2, '0') ?? '00';
        String minutes = time.min?.toString().padLeft(2, '0') ?? '00';
        String seconds = time.sec?.toString().padLeft(2, '0') ?? '00';

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 小时数字
            _buildTimeBox(hours, digitStyle),
            _buildSeparator(),
            // 分钟数字
            _buildTimeBox(minutes, digitStyle),
            _buildSeparator(),
            // 秒钟数字
            _buildTimeBox(seconds, digitStyle),
          ],
        );
      },
    );
  }

  // 构建每个时间段（小时、分钟、秒）的显示框
  Widget _buildTimeBox(String time, TextStyle style) {
    return Container(
      width: boxWidth.w,
      height: boxHeight.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0XFFced3d9), Color(0xffffffff), Color(0XFFced3d9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          time,
          style: style, // 自定义样式
        ),
      ),
    );
  }

  // 构建冒号分隔符
  Widget _buildSeparator() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.w, left: 6.w, right: 6.w),
      child: Text(
        ':',
        style: separatorStyle, // 自定义冒号样式
      ),
    );
  }
}
