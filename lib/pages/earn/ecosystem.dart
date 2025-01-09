import 'package:airdrop_flutter/controllers/ecosystem_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EarnEcosystem extends StatefulWidget {
  EarnEcosystem({Key? key}) : super(key: key);

  @override
  State<EarnEcosystem> createState() => _EarnEcosystemState();
}

class _EarnEcosystemState extends State<EarnEcosystem> {
  final EcosystemController controller = Get.put(EcosystemController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ecosystem',
            style: TextStyle(
                color: Color(0XFFFFFFFF),
                fontSize: 24.sp,
                fontWeight: FontWeight.w700),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16.w),
            child: Text(
              'Those Ecosystems that Cooperate with AirDrop Coins',
              style: TextStyle(
                  color: Color(0XFFFFFFFF).withOpacity(0.65),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Column(
            children: controller.ecosystemList.map((item) {
              int index = controller.ecosystemList.indexOf(item);
              return Container(
                width: 343.w,
                height: 202.w,
                margin: EdgeInsets.only(bottom: 8.w),
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color(0XFFFFFFFF).withOpacity(0.15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          // width: 92.w,
                          // height: 22.w,
                          margin: EdgeInsets.only(right: 5.w),
                          padding: EdgeInsets.only(
                              left: 12.w, right: 12.w, top: 6.w, bottom: 6.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21.r),
                              color: Color(0XFF000000).withOpacity(0.5)),
                          child: Text(
                            'Ecosystem',
                            style: TextStyle(
                                color: Color(0XFFE5B045),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5.w),
                          padding: EdgeInsets.only(
                              left: 12.w, right: 12.w, top: 6.w, bottom: 6.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21.r),
                              color: Color(0XFF000000).withOpacity(0.5)),
                          child: Text(
                            'Pool Donations',
                            style: TextStyle(
                                color: Color(0XFFE5B045),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.w, bottom: 8.w),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            child: Image.asset(
                              'assets/images/earn_icon2.png',
                              width: 32.w,
                              height: 32.w,
                            ),
                          ),
                          Text(
                            controller.ecosystemList[index],
                            style: TextStyle(
                                color: Color(0XFFFFFFFF),
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Solana is a blockchain built for mass adoption. It\'s a high performance network that is utilized for a range of use cases, including finance, NFTs, payments, and...',
                      style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      child: Text(
                        'Prize pool contribution: 301.302149 Sol',
                        style: TextStyle(
                            color: Color(0XFFFC7700),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
