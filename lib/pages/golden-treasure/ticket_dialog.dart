import 'package:airdrop_flutter/controllers/user_assets.controller.dart';
import 'package:airdrop_flutter/models/assets.dart';
import 'package:airdrop_flutter/pages/friends/icon.dart';
import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/service/api_games_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../../models/wbpactivity.dart';

class TicketDialog extends StatefulWidget {
  final Wbpactivity data;
  final Asset? token;
  const TicketDialog({super.key, required this.token, required this.data});

  @override
  State<StatefulWidget> createState() => _TicketDialogState();
}

class _TicketDialogState extends State<TicketDialog> {
  UserAssetsController assetListController = Get.put(UserAssetsController());
  // final storage = Get.find<StorageService>();
  final gameService = GameService();

  final List<int> options = [5, 10];
  int amount = 1;

  final formatter = NumberFormat('#,##0.##');

  void handleJoinActivity() async {
    try {
      SmartDialog.showLoading();
      final response = await gameService.JoinWbpactivity(
          widget.data.activityId.toString(), amount.toString());

      if (response.statusCode == 200) {
        if (response.data['code'] == 200) {
          SmartDialog.dismiss();
          Get.back<String>(result: "closed");
          Get.snackbar(
            "${widget.data.activityTitle}",
            "Participation successful",
            colorText: Colors.black,
            backgroundColor: const Color.fromRGBO(217, 155, 33, 1),
            barBlur: 1,
            overlayBlur: 1,
          );
        }
      }
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // UserAssetList();
  }

  @override
  Widget build(BuildContext context) {
    // final adt = storage.balances["ADT"];
    final token = widget.token;
    final tokenAmount = double.parse((token?.amount ?? "").toString());
    final assetExpense = double.parse(widget.data.assetExpense);
    final maxJoin = widget.data.maxJoin;
    final curJoin = widget.data.curJoin;
    final payAmount = assetExpense * amount;
    final buyLimit = widget.data.buyLimit;
    final buyAmount = widget.data.buyAmount;

    final isFull = curJoin == maxJoin;

    final max = min(
      (tokenAmount / assetExpense).floor(),
      min(
        maxJoin - curJoin,
        buyLimit - buyAmount,
      ),
    );

    final disable = isFull ||
        max == 0 ||
        max - amount < 0 ||
        buyLimit - buyAmount - amount < 0;
    return Container(
      // width: double.infinity,
      height: 600.w,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(230, 235, 242, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 12.w,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Investment confirmation",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 32.w,
              ),
              SizedBox(
                height: 140.w,
                child: Stack(
                  children: [
                    Positioned(
                        child: Image(
                      image: NetworkImage(
                        widget.data.awardAssetIcon,
                      ),
                    )),
                    Positioned(
                        bottom: 12.w,
                        right: 12.w,
                        child: SvgPicture.asset(
                          "assets/svg/proof.svg",
                          height: 60.w,
                          width: 60.w,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 16.w,
              ),
              Flex(
                direction: Axis.horizontal,
                spacing: 16.w,
                children: [
                  for (int i = 0; i < options.length; i++)
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            amount = options[i];
                          });
                        },
                        child: Container(
                          height: 40.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.w)),
                            color: amount == options[i]
                                ? const Color.fromRGBO(229, 176, 69, 1)
                                : const Color.fromRGBO(218, 223, 229, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 16.w,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/proof.svg",
                                height: 26.w,
                                width: 26.w,
                              ),
                              Text(
                                options[i].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  fontFamily: "D-DIN-PRO",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              Flex(
                direction: Axis.horizontal,
                spacing: 16.w,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        border: Border.all(
                          width: 1.w,
                          color: Colors.black,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (amount > 1) {
                              amount -= 1;
                            }
                          });
                        },
                        child: Container(
                          width: 80.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.85),
                                width: 3.w,
                              ),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.w),
                            ),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(207, 212, 229, 1),
                              Color.fromRGBO(188, 192, 204, 1)
                            ]),
                          ),
                          child: Center(
                            child: SvgPicture.asset("assets/svg/sub.svg"),
                          ),
                        ),
                      )),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            fontFamily: "D-DIN-PRO",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.w)),
                      border: Border.all(
                        width: 1.w,
                        color: Colors.black,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (amount < widget.data.maxJoin) {
                            amount += 1;
                          }
                        });
                      },
                      child: Container(
                        width: 80.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: const Color.fromRGBO(255, 255, 255, 0.85),
                              width: 3.w,
                            ),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.w),
                          ),
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(207, 212, 229, 1),
                            Color.fromRGBO(188, 192, 204, 1)
                          ]),
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/add.svg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Required".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "Figtree",
                      ),
                    ),
                    AdtIcon(
                      value: formatter.format(payAmount).toString(),
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Balance".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "Figtree",
                      ),
                    ),
                    AdtIcon(
                      value: formatter.format(tokenAmount).toString(),
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Progress".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: "Figtree",
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 4.w,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.w)),
                              color: const Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              final w = constraints.minWidth *
                                  (widget.data.curJoin / widget.data.maxJoin);
                              return UnconstrainedBox(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: w,
                                  height: 4.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.w)),
                                    color:
                                        const Color.fromRGBO(229, 176, 69, 1),
                                  ),
                                ),
                              );
                            }),
                          ),
                          // Text(
                          //   "${widget.data.curJoin}/${widget.data.maxJoin}",
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: 14.sp,
                          //     fontFamily: "D-DIN-PRO",
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              InkWell(
                onTap: () {
                  if (disable) return;
                  handleJoinActivity();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.w),
                    ),
                  ),
                  child: Container(
                    // width: 138.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: disable
                              ? const Color.fromRGBO(255, 255, 255, 0.65)
                              : const Color.fromRGBO(254, 255, 209, 0.65),
                          width: 2.w,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.w),
                      ),
                      gradient: LinearGradient(
                        colors: disable
                            ? [
                                const Color.fromRGBO(207, 212, 229, 1),
                                const Color.fromRGBO(188, 192, 204, 1)
                              ]
                            : [
                                const Color.fromRGBO(229, 175, 69, 1),
                                const Color.fromRGBO(217, 155, 33, 1)
                              ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          fontFamily: 'Figtree',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isFull)
                Text(
                  "The quota for the current round is full. Please choose another round to participate!"
                      .tr,
                  style: TextStyle(fontSize: 12.sp, color: Colors.red),
                )
              else
                Text(
                  "You have purchased ${widget.data.buyAmount} tickets (maximum ${widget.data.buyLimit} tickets per user per transaction)"
                      .tr,
                  style: TextStyle(fontSize: 12.sp, color: Colors.red),
                )
            ],
          ),
        ),
      ),
    );
  }
}
