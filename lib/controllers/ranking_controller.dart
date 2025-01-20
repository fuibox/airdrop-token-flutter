import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/utils/logger.dart';
import 'package:get/get.dart';

class RankingController extends GetxController {
  RxList rankingList = [].obs;
  RxMap userInfoRank = {}.obs;

  void refreshData() {}

  void loadMoreData() {}

  Future<void> getUserRanks() async {
    try {
      final result = await userAssetsService.AssetsMyRank();

      userInfoRank.value = result.data['data'];

      AppLogger.instance.d('用户排名: ${result.data['data']}');
    } catch (e) {
      AppLogger.instance.e('用户排名出错: $e');
    }
  }

  Future<void> getRankList() async {
    try {
      final result = await userAssetsService.AssetsRankList();

      // userInfoRank.value = result.data;
      rankingList.value = result.data['data'];
      getUserRanks();

      AppLogger.instance.d('排行榜: ${result.data['data']}');
    } catch (e) {
      AppLogger.instance.e('排行榜出错: $e');
    }
  }
}
