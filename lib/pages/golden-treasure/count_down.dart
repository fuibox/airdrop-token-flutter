import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Countdown extends StatefulWidget {
  int timestamp;
  Countdown({super.key, required this.timestamp});

  @override
  State<StatefulWidget> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> with TickerProviderStateMixin {
  int remainingTimestamp = 0;
  late Timer countdownTimer;

  String formatRemainingTime(int timestamp) {
    DateTime now = DateTime.now();
    DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    Duration remaining = targetTime.difference(now);
    if (remaining.inMilliseconds <= 0) {
      return '00:00:00';
    }
    int hours = remaining.inHours;
    int minutes = remaining.inMinutes.remainder(60);
    int seconds = remaining.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    remainingTimestamp = widget.timestamp;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        DateTime now = DateTime.now();
        Duration remaining =
            DateTime.fromMillisecondsSinceEpoch(remainingTimestamp)
                .difference(now);

        if (remaining.inSeconds <= 0) {
          timer.cancel();
          remainingTimestamp = 0;
        } else {
          remainingTimestamp -= 0;
        }
      });
    });
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${formatRemainingTime(remainingTimestamp)}",
      style: TextStyle(
        fontFamily: 'Figtree',
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: Colors.white,
      ),
    );
  }
}
