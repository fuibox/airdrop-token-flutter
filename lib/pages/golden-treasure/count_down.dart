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

class _CountdownState extends State<Countdown> {
  int remainingTimestamp = 0;
  late Timer countdownTimer;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    remainingTimestamp = widget.timestamp;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        DateTime now = DateTime.now().toUtc();
        Duration remaining;
        if (now.millisecondsSinceEpoch <= remainingTimestamp) {
          remaining = DateTime.fromMillisecondsSinceEpoch(remainingTimestamp,
                  isUtc: true)
              .difference(now);
        } else {
          remaining = DateTime.fromMillisecondsSinceEpoch(
                  now.millisecondsSinceEpoch,
                  isUtc: true)
              .difference(DateTime.fromMillisecondsSinceEpoch(
                  remainingTimestamp,
                  isUtc: true));
        }

        if (remaining.inSeconds <= 0) {
          timer.cancel();
          remainingTimestamp = 0;

          hours = 0;
          minutes = 0;
          seconds = 0;
        } else {
          hours = remaining.inHours;
          minutes = remaining.inMinutes.remainder(60);
          seconds = remaining.inSeconds.remainder(60);
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
      '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: TextStyle(
        fontFamily: 'Figtree',
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: Colors.white,
      ),
    );
  }
}
