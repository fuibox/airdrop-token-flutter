import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/service/api_earn_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class UserCardListController extends GetxController {
  final storage = Get.find<StorageService>();

  RxList cardList = [].obs;

  RxInt cardNum = 1.obs;

  RxString cardTgId = ''.obs;
  RxBool recycleState = false.obs;
  RxBool sendState = false.obs;

  void addCardNum(bool add, int balance) async {
    if (balance != cardNum.value) {
      if (add == true) {
        cardNum++;
      } else {
        cardNum--;
      }
    }
  }

  // 获取NFC配置
  void getUserNFCList() async {
    try {
      cardList.assignAll(storage.userLottery.value['cards']);
      cardList.removeWhere((item) => item["balance"] == 0);

      cardList.sort((a, b) => a["cardId"].compareTo(b["cardId"]));
      final result = await userAssetsService.AssetNFCConfigs();
      AppLogger.instance.e('获取NFC配置:${result.data}');
      AppLogger.instance.e('获取NFC配置:${cardList}');
    } catch (e) {
      AppLogger.instance.e('获取NFC配置:$e');
    }
  }

  // 回收卡片
  void getRecycleCard(String cardId, String recycleNum) async {
    try {
      recycleState.value = true;
      final result =
          await userAssetsService.AssetRecycleCard(cardId, recycleNum);
      AppLogger.instance.e('回收NFC:${result.data}');
      if (result.data['code'] == 200) {
        recycleState.value = false;

        SmartDialog.dismiss();
        SmartDialog.showToast('SUCCESS', alignment: Alignment.center);
        final result1 = await earnService.EarnLotteryInfo();
        storage.userLottery.value =
            result1.data['data'] as Map<String, dynamic>;
        getUserNFCList();
      } else {
        recycleState.value = false;

        SmartDialog.showToast('${result.data['message']}',
            alignment: Alignment.center);
      }
    } catch (e) {
      AppLogger.instance.e('回收NFC:$e');
    }
  }

  // 赠送卡片
  void UserGiftCard(String cardId, String toAddress, String giftNumber) async {
    try {
      sendState.value = true;
      final result = await userAssetsService.AssetGiftCardNFC(
          cardId, toAddress, giftNumber);
      AppLogger.instance.e('赠送NFC:${result.data}');
      if (result.data['code'] == 200) {
        sendState.value = false;
        SmartDialog.dismiss();
        SmartDialog.showToast('SUCCESS', alignment: Alignment.center);
        final result1 = await earnService.EarnLotteryInfo();
        storage.userLottery.value =
            result1.data['data'] as Map<String, dynamic>;
        getUserNFCList();
      } else {
        sendState.value = false;
        SmartDialog.showToast('${result.data['message'] ?? ''}',
            alignment: Alignment.center);
      }
    } catch (e) {
      AppLogger.instance.e('赠送NFC:$e');
    }
  }

  // 合成卡片
  void getSynthesis() async {
    try {
      final result = await userAssetsService.AssetSynthesisNFC();
      AppLogger.instance.e('合成NFC:${result.data}');
    } catch (e) {
      AppLogger.instance.e('合成NFC:$e');
    }
  }
}
