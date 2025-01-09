import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class InviteLevel extends StatelessWidget {
  bool? active = false;
  String? count;
  String? value;
  InviteLevel({super.key, this.value, this.active, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68.w,
      child: Column(
        children: [
          Image(
            width: active == true ? 32.w : 20.w,
            height: active == true ? 32.w : 20.w,
            image: const AssetImage("assets/images/gift.png"),
          ),
          SizedBox(
            height: 2.w,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'D-DIN-PRO',
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: "${count ?? 0} ",
                ),
                TextSpan(
                  text: 'invites',
                  style: TextStyle(
                    fontFamily: "Figtree",
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color.fromRGBO(255, 255, 255, 0.65),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 36.w,
            height: 18.w,
            margin: EdgeInsets.only(
              top: 4.w,
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(115, 71, 40, 0.45),
              borderRadius: BorderRadius.all(
                Radius.circular(20.w),
              ),
            ),
            child: Center(
              child: Text(
                value ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  fontFamily: 'Figtree',
                  color: const Color.fromRGBO(204, 157, 63, 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
