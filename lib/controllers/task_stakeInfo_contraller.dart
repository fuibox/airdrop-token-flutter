import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:get/get.dart';

class TaskStakeinfoContraller extends GetxController {
  /// 获取用户质押信息
  Future<void> getUserStakeInfo() async {
    try {
      final result = await userAssetsService.UserStakeInfo();

      AppLogger.instance.e(result.data);
    } catch (e) {
      AppLogger.instance.e('获取用户质押信息报错:${e}');
    }
  }

  /// 解锁质押
  Future<void> postUserStakeUnlock() async {
    try {
      final result = await userAssetsService.AssetStakeUnlock();
      AppLogger.instance.e(result.data);
    } catch (e) {
      AppLogger.instance.e('解锁质押报错:${e}');
    }
  }

  /// 质押币安币
  Future<void> postUserStakeBnb() async {
    try {
      final result = await userAssetsService.AssetStakeBNB();
      AppLogger.instance.e(result.data);
    } catch (e) {
      AppLogger.instance.e('质押bnb报错:${e}');
    }
  }

  /// 领取每日质押奖励
  Future<void> postUserStakeRewardClaim() async {
    try {
      final result = await userAssetsService.AssetStakeRewardClaim();
      AppLogger.instance.e(result.data);
    } catch (e) {
      AppLogger.instance.e('领取每日质押报错:${e}');
    }
  }
}
