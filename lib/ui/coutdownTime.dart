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

        // 获取倒计时的天数、小时、分钟
        int days = time.days ?? 0;
        String hours = (time.hours ?? 0).toString().padLeft(2, '0');
        String minutes = (time.min ?? 0).toString().padLeft(2, '0');

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 显示天数
            _buildTimeBox('$days', digitStyle),
            _buildSeparator(),
            // 显示小时
            _buildTimeBox(hours, digitStyle),
            _buildSeparator(),
            // 显示分钟
            _buildTimeBox(minutes, digitStyle),
          ],
        );
      },
    );
  }

  // 构建每个时间段（天、小时、分钟）的显示框
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
