// ignore: must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxBackdrop extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;

  BoxBackdrop({super.key, this.child, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16.w)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.w, sigmaY: 12.w),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18.w)),
            border: Border(
              top: BorderSide(
                color: const Color.fromRGBO(255, 255, 255, 0.15),
                width: 2.w,
              ),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.15),
                offset: Offset(0, -2),
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
