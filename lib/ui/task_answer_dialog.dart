import 'package:airdrop_flutter/controllers/task_answer_controller.dart';
import 'package:airdrop_flutter/ui/task_correct.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void showBottomAnswer({String message = 'test'}) {
  final TaskAnswerController answerController = Get.put(TaskAnswerController());

  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    builder: (_) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Color(0XFFe6ebf2),
        ),
        height: 500.w,
        width: double.infinity,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
        child: Obx(() {
          return Column(
            children: [
              //nav
              Container(
                margin: EdgeInsets.only(bottom: 36.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/assets_dialog_close.png',
                      width: 28.w,
                      height: 28.w,
                      color: Colors.black.withOpacity(0),
                      colorBlendMode: BlendMode.dstATop,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: Text(
                        'Quiz Tasks',
                        style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        SmartDialog.dismiss();
                      },
                      child: Image.asset(
                        'assets/images/assets_dialog_close.png',
                        width: 28.w,
                        height: 28.w,
                      ),
                    )
                  ],
                ),
              ),

              // box
              Container(
                width: 343.w,
                height: answerController.questionData.value.length > 0
                    ? null
                    : 300.w,
                padding: EdgeInsets.only(left: 16.w, top: 20.w, bottom: 10.w),
                margin: EdgeInsets.only(bottom: 20.w),
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(16.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 80.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Daily Quizs',
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 12.sp,
                                  fontFamily: 'Figtree'),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10.w, bottom: 15.w),
                      width: 250.w,
                      child: Text(
                        '${answerController.question}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000)),
                      ),
                    ),
                    Column(
                      children: answerController.questionData.map((item) {
                        int index = answerController.questionData.indexOf(item);

                        return InkWell(
                          onTap: () {
                            AppLogger.instance.d(index);
                            answerController.updateAnswerState(index);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 12.w),
                            width: 311.w,
                            height: 35.w,
                            margin: EdgeInsets.only(bottom: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: answerController.answerStates[index] == 1
                                    ? Colors.green.withOpacity(0.5)
                                    : answerController.answerStates[index] == -1
                                        ? Colors.red.withOpacity(0.5)
                                        : Color(0xffe6ebf2)),
                            child: Row(
                              children: [
                                Text(
                                  answerController.questionData[index]
                                      .toString(),
                                  style: TextStyle(
                                      color: answerController
                                                  .answerStates[index] ==
                                              1
                                          ? Colors.green
                                          : answerController
                                                      .answerStates[index] ==
                                                  -1
                                              ? Colors.red
                                              : Color(0xff000000)),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  if (answerController.answerStates.contains(1)) {
                    // answerController.goToNextQuestion();
                    answerController.validateAnswer();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0.w),
                  width: 343.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Color(0xff000000)),
                      borderRadius: BorderRadius.circular(8.r),
                      color: answerController.answerStates.contains(1)
                          ? Color(0XFFD99B21)
                          : Color(0XFFd9d9d9)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border(
                            top: BorderSide(
                                width: 3.w,
                                color: Color(0XFFFEFFff).withOpacity(0.65)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16.sp,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        })),
  );
}
