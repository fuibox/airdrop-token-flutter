import 'dart:async';

import 'package:airdrop_flutter/controllers/login_controller.dart';
import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/service/api_earn_service.dart';
import 'package:airdrop_flutter/ui/earn_prizedraw_dialog.dart';
import 'package:airdrop_flutter/ui/task_correct.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class EarnPrizedrawController extends GetxController {
  LoginController loginController = Get.put(LoginController());

  var isShowShare = false;
  RxList<Map<String, dynamic>> assetsList = RxList<Map<String, dynamic>>();
  RxString imageUrl =
      'https://airdrop-static.jyczg888.uk/web/lottery-treasure.png'.obs;
  RxBool isAnimationComplete = false.obs;
  RxInt exChangeAmount = 1.obs; // 盒子数量
  RxInt unitPrice = 30.obs; // 单价
  RxInt priceState = 30.obs; // 当前价格

  Future<void> playAnimationSequence() async {
    imageUrl.value = '';

    isAnimationComplete.value = true;

    await Future.delayed(Duration(seconds: 3));

    isAnimationComplete.value = false;

    imageUrl.value = 'https://airdrop-static.jyczg888.uk/web/lottery-down.png';

    await Future.delayed(Duration(seconds: 2));

    imageUrl.value =
        'https://airdrop-static.jyczg888.uk/web/lottery-treasure.png';
  }

  // 获取抽奖余额
  Future<void> UserPrizeDraw() async {
    try {
      final result = await earnService.EarnLotteryInfo();
      AppLogger.instance.e('抽奖余额:${result.data}');
    } catch (e) {
      AppLogger.instance.e('获取抽奖余额报错:$e');
    }
  }

  // 抽奖
  Future<void> UserLotteryDraw(String drawNumber) async {
    try {
      await playAnimationSequence();
      final result = await earnService.EarnLottery(drawNumber);
      isShowShare = result.data['data']['isShowShare'];
      if (result.data['data']['assetList'] is List) {
        assetsList.assignAll((result.data['data']['assetList'] as List)
            .map((e) => Map<String, dynamic>.from(e))
            .toList());
      }

      SmartDialog.show(
        alignment: Alignment.topCenter,
        clickMaskDismiss: true,
        usePenetrate: false,
        builder: (_) => FlipCardWidget(
          isShowShare: isShowShare,
          assetList: assetsList,
        ),
      );

      AppLogger.instance.e('抽奖${drawNumber}次:${result.data}');
      // 刷新userinfo/assetslist
      await loginController.UserConfig();
    } catch (e) {
      AppLogger.instance.e('抽奖:$e');
    }
  }

  // 兑换抽奖机会
  Future<void> UserExchangeBox(String amount) async {
    try {
      final result = await earnService.EarnLotteryExchangebox(amount);
      if (result.data['code'] == 200) {
        AppLogger.instance.e('兑换抽奖${amount}次:${result.data}');
        resetPrize();
        SmartDialog.dismiss();
        SmartDialog.showToast('SUCCESS', alignment: Alignment.center);
        showBottomCorrect();

        // 刷新userinfo/assetslist
        await loginController.UserConfig();
      } else {
        SmartDialog.showToast('${result.data['message']}',
            alignment: Alignment.center);
      }
    } catch (e) {
      AppLogger.instance.e('兑换抽奖次数报错:$e');
    }
  }

  void updatePrize(bool add) {
    // add + true - false
    if (add == true) {
      exChangeAmount++;
      priceState.value = exChangeAmount.value * unitPrice.value;
    } else {
      if (exChangeAmount != 1) {
        exChangeAmount--;
        priceState.value = exChangeAmount.value * unitPrice.value;
      }
    }
  }

  void resetPrize() {
    exChangeAmount.value = 1; // 盒子数量
    unitPrice.value = 30; // 单价
    priceState.value = 30; // 当前价格
  }

  void setPrize(int amount) {
    exChangeAmount.value = amount;
    priceState.value = exChangeAmount.value * unitPrice.value;
  }
}
