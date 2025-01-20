import 'package:dio/dio.dart';
import "api_service.dart";

class UserAssetsService {
  // 短信验证
  Future<Response> loginVerify(String zone, String phone, String code) async {
    try {
      final response = await dioService.postRequest(
        'user/verify_login_sms',
        {
          'zone': zone,
          'phone': phone,
          'code': code,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 修改用户昵称
  Future<Response> UpdateUserName(String userName) async {
    try {
      Map<String, dynamic> queryParams = {
        'nickName': userName,
      };
      final response =
          await dioService.getRequest('user/update_nickname?$queryParams');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 资产列表
  Future<Response> UserAssetList() async {
    try {
      final response = await dioService.getRequest('asset/list');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 资产排名列表
  Future<Response> AssetsRankList() async {
    try {
      final response = await dioService.getRequest('asset/get_rank_list');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 获取我的资产排名
  Future<Response> AssetsMyRank() async {
    try {
      final response = await dioService.getRequest('asset/get_my_rank');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 查看奖金池
  Future<Response> AssetsProzePoolList() async {
    try {
      final response = await dioService.getRequest('prize_pool/list');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 获取资产充值链路及地址
  Future<Response> AssetsDepositAddress(String assetId) async {
    try {
      Map<String, dynamic> queryParams = {
        'assetId': assetId,
      };

      final response = await dioService.getRequest(
          'asset/get_asset_deposit_address',
          queryParams: queryParams);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 赠送代币资产
  Future<Response> AssetGiftTokens(
      String cardId, String toAddress, String giftNumber) async {
    try {
      final response = await dioService.postRequest('asset/gift_tokens',
          {'cardId': cardId, 'toAddress': toAddress, 'giftNumber': giftNumber});

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 获取充值地址
  Future<Response> AssetGetDepositAddress(String chainName) async {
    try {
      Map<String, dynamic> queryparams = {'chainName': chainName};
      final response = await dioService.getRequest('asset/get_deposit_address',
          queryParams: queryparams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /**
   * NFC
   */
  // 获取NFC配置
  Future<Response> AssetNFCConfigs() async {
    try {
      final response = await dioService.getRequest('asset/nft/configs');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 回收卡片
  Future<Response> AssetRecycleCard(String cardId, String recycleNum) async {
    try {
      Map<String, dynamic> queryparams = {
        'cardId': cardId,
        'recycleNum': recycleNum
      };
      final response = await dioService.getRequest('asset/recycle_card',
          queryParams: queryparams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 合成卡片
  Future<Response> AssetSynthesisNFC() async {
    try {
      final response = await dioService.getRequest('asset/synthesis_nft');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 赠送卡片
  Future<Response> AssetGiftCardNFC(
      String cardId, String toAddress, String giftNumber) async {
    try {
      final response = await dioService.postRequest('asset/gift_card',
          {'cardId': cardId, 'toAddress': toAddress, 'giftNumber': giftNumber});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /**
   *  质押
   */
  // 获取用户质押信息
  Future<Response> UserStakeInfo() async {
    try {
      final response = await dioService.getRequest('user/stake_info');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 质押币安币
  Future<Response> AssetStakeBNB() async {
    try {
      final response = await dioService.postRequest('asset/stake_bnb', {});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 领取每日质押奖励
  Future<Response> AssetStakeRewardClaim() async {
    try {
      final response =
          await dioService.postRequest('asset/stake_reward_claim', {});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 解锁质押
  Future<Response> AssetStakeUnlock() async {
    try {
      final response = await dioService.postRequest('asset/stake_unlock', {});
      return response;
    } catch (e) {
      rethrow;
    }
  }
  /**
   * 提现相关
   */

  // 获取资产提现链路及地址
  Future<Response> AssetGetWithdrawAddress(String assetId) async {
    try {
      Map<String, dynamic> queryParams = {'assetId': assetId};
      final response = await dioService.getRequest('asset/get_withdraw_address',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 提交提现
  Future<Response> AssetwithDraw(
      String assetId, String toAddress, num amount, num chainId) async {
    try {
      final response = await dioService.postRequest('asset/withdraw', {
        'assetId': assetId,
        'toAddress': toAddress,
        'amount': amount,
        'chainId': chainId
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

final userAssetsService = UserAssetsService();
