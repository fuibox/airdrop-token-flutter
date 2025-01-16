import 'package:dio/dio.dart';
import "api_service.dart";

class EarnService {
  // 获取我的抽奖余额
  Future<Response> EarnLotteryInfo() async {
    try {
      final response = await dioService.getRequest('lottery/info');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 抽奖
  Future<Response> EarnLottery(String drawNumber) async {
    try {
      Map<String, dynamic> queryParams = {'drawNumber': drawNumber};
      final response =
          await dioService.getRequest('lottery/draw', queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 兑换抽奖机会
  Future<Response> EarnLotteryExchangebox(String amount) async {
    try {
      Map<String, dynamic> queryParams = {'amount': amount};
      final response = await dioService.getRequest('lottery/exchangebox',
          queryParams: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

final earnService = EarnService();
