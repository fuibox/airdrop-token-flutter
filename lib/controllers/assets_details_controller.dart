import 'package:airdrop_flutter/controllers/login_controller.dart';
import 'package:airdrop_flutter/routes/app_pages.dart';
import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class AssetsDetailsController extends GetxController {
  LoginController loginController = Get.put(LoginController());

  var userTokenDetails = {}.obs;
  RxBool isExpanded = false.obs;

  // 赠送金额
  RxString presentAmount = ''.obs;

  // tgid
  RxString presentTGid = ''.obs;

  // 充值数据
  var depositData = {};

  // 提现金额
  RxString withDrawAmount = ''.obs;

  // 提现地址
  RxString withDrawAddress = ''.obs;

  RxList billsList = [].obs;

  String getFormattedAmount() {
    double? amount = double.tryParse(presentAmount.value);
    if (amount != null) {
      double result = amount / 20;
      return result.toStringAsFixed(2);
    } else {
      return '0.00';
    }
  }

  String getFormattedWithDrawAmount() {
    double? amount = double.tryParse(withDrawAmount.value);
    if (amount != null) {
      double result = amount / 20;
      return result.toStringAsFixed(2);
    } else {
      return '0.00';
    }
  }

  Future<void> goAssetsDetails(Map item) async {
    AppLogger.instance.d(item);
    Get.toNamed(AppPages.assets, arguments: item);
  }

  // 赠送代币资产
  Future<void> userGiftTokens(
      String assetId, String toAddress, String giftNumber) async {
    try {
      final result = await userAssetsService.AssetGiftTokens(
          assetId, toAddress, giftNumber);

      if (result.data['code'] == 200) {
        SmartDialog.dismiss();
        SmartDialog.showToast('SUCCESS');
        loginController.UserConfig();
      }
      AppLogger.instance.d('赠送代币:${result.data}');
    } catch (e) {
      AppLogger.instance.e('赠送代币:$e');
    }
  }

  // 获取充值地址
  Future<void> getDepositAddress(String chainName) async {
    try {
      final result = await userAssetsService.AssetGetDepositAddress(chainName);

      AppLogger.instance.d('充值地址:${result.data}');
    } catch (e) {
      AppLogger.instance.e('充值地址:$e');
    }
  }

  // 获取资产充值链路及地址
  Future<void> getAssetsDepositAddress(String assetId) async {
    try {
      final result = await userAssetsService.AssetsDepositAddress(assetId);

      depositData = result.data['data'][0];
      AppLogger.instance.d('获取资产充值链路及地址:${result.data}');
    } catch (e) {
      AppLogger.instance.e('获取资产充值链路及地址:$e');
    }
  }

  // // 获取资产提现链路及地址
  // Future<void> getAssetWithdrawAddress(String assetid) async {
  //   try {
  //     final result = await userAssetsService.AssetGetWithdrawAddress(assetid);
  //     AppLogger.instance.d('获取资产提现链路及地址:${result.data}');
  //   } catch (e) {
  //     AppLogger.instance.e('获取资产提现链路及地址:$e');
  //   }
  // }

  // 提交提现
  Future<void> userAssetWithdraw(
      String assetId, String toAddress, num amount, num chainId) async {
    try {
      final result = await userAssetsService.AssetwithDraw(
          assetId, toAddress, amount, chainId);

      if (result.data['code'] == 200) {
        SmartDialog.dismiss();
        SmartDialog.showToast('SUCCESS');
        loginController.UserConfig();
      } else {
        AppLogger.instance.d('提交提现:${result.data}');
        SmartDialog.showToast('${result.data['message']}');
      }
    } catch (e) {
      AppLogger.instance.e('提交提现:$e');
    }
  }

  // 记录列表
  Future<void> getBillsList(String assetId) async {
    try {
      final result = await userAssetsService.getTokenBills(assetId);

      billsList.assignAll(result.data['data']);

      AppLogger.instance.d('提交提现:${result.data}');
    } catch (e) {
      AppLogger.instance.d('提交提现:$e');
    }
  }
}
