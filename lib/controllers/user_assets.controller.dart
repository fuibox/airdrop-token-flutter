import 'dart:async';

import 'package:airdrop_flutter/service/api_assets_service.dart';
import 'package:airdrop_flutter/service/api_user_service.dart';
import 'package:get/get.dart';

class UserAssetsController extends GetxController {
  List assetsList = [].obs;

  Future<void> UserAssetList() async {
    try {
      final response = await userAssetsService.UserAssetList();
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      print('asset/list：$e');
    }
  }

  Future<void> UserInfo() async {
    try {
      final response = await userService.UserInfo();
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      print('asset/list：$e');
    }
  }
}
