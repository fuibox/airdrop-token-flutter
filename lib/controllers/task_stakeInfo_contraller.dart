import 'package:airdrop_flutter/controllers/login_controller.dart';
import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/utils/endNumber.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class TaskStakeinfoContraller extends GetxController {
  LoginController loginController = Get.put(LoginController());

  RxMap stakeInfo = {}.obs;

  /// 获取用户质押信息
  Future<void> getUserStakeInfo() async {
    try {
      final result = await userAssetsService.UserStakeInfo();

      if (result.data['code'] == 200) {
        stakeInfo.value = result.data['data'];
        AppLogger.instance
            .e(calculateRemainingTime(stakeInfo['expireTime'] ?? 0));
      }

      AppLogger.instance.e('用户质押信息${stakeInfo.value['expireTime']}');
    } catch (e) {
      AppLogger.instance.e('获取用户质押信息报错:${e}');
    }
  }

  /// 解锁质押
  Future<void> postUserStakeUnlock() async {
    try {
      final result = await userAssetsService.AssetStakeUnlock();
      if (result.data['code'] == 200) {}
      AppLogger.instance.e('解锁质押${result.data}');
      SmartDialog.dismiss();
      SmartDialog.showToast('SUCCESS');
      getUserStakeInfo();
    } catch (e) {
      AppLogger.instance.e('解锁质押报错:${e}');
    }
  }

  /// 质押币安币
  Future<void> postUserStakeBnb() async {
    try {
      final result = await userAssetsService.AssetStakeBNB();
      AppLogger.instance.e(result.data);
      if (result.data['code'] == 200) {
        // postUserStakeUnlock();
        getUserStakeInfo();
        AppLogger.instance.d('刷新用户config');
        loginController.UserConfig();
      }
    } catch (e) {
      AppLogger.instance.e('质押bnb报错:${e}');
    }
  }

  /// 领取每日质押奖励
  Future<void> postUserStakeRewardClaim() async {
    try {
      final result = await userAssetsService.AssetStakeRewardClaim();
      AppLogger.instance.e(result.data);
      if (result.data['code'] == 200) {
        AppLogger.instance.d('刷新用户config');
        SmartDialog.showToast('${result.data['message']}',
            alignment: Alignment.center);
        loginController.UserConfig();
      } else {
        SmartDialog.showToast('${result.data['message']}',
            alignment: Alignment.center);
      }
    } catch (e) {
      AppLogger.instance.e('领取每日质押报错:${e}');
    }
  }
}
