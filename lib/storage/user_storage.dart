import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  static const String _keyIsLoggedIn = 'is_logged_in'; // 登录状态
  static const String _keyUserInfo = 'user_info'; // 用户信息
  static const String _keyPrizePool = 'prize_pool'; // 奖金池
  static const String _keyAssetsList = 'assets_list'; // 用户币种列表
  static const String _token = ''; // token
  static const String _keyUserRank = 'user_rank'; // 用户排名
  static const String _keyUserLottery = 'user_lottery'; //用户抽奖
  static const String _keyUserWinner = 'user_winner'; // 用户通知列表

  late GetStorage _storage;

  // 单例模式
  static final StorageService _instance = StorageService._internal();

  factory StorageService() => _instance;

  StorageService._internal();

  /// 响应式变量
  final RxBool isLoggedIn = false.obs;
  final RxMap<String, dynamic> userInfo = <String, dynamic>{}.obs;
  final RxMap<String, dynamic> prizePool = <String, dynamic>{}.obs;
  final RxList assetsList = [].obs;
  final RxString token = ''.obs;
  final RxMap<String, dynamic> userRank = <String, dynamic>{}.obs;
  final RxMap<String, dynamic> userLottery = <String, dynamic>{}.obs;
  final RxList userWinner = [].obs;

  /// 初始化 GetStorage 并同步到响应式变量
  @override
  Future<void> onInit() async {
    await GetStorage.init();
    _storage = GetStorage();

    // 从存储中同步数据到 obs 变量
    isLoggedIn.value = _storage.read<bool>(_keyIsLoggedIn) ?? false;
    userInfo.value = Map<String, dynamic>.from(
        _storage.read<Map<String, dynamic>>(_keyUserInfo) ?? {});
    prizePool.value = Map<String, dynamic>.from(
        _storage.read<Map<String, dynamic>>(_keyPrizePool) ?? {});
    userInfo.value = Map<String, dynamic>.from(
        _storage.read<Map<String, dynamic>>(_keyUserRank) ?? {});
    userLottery.value = Map<String, dynamic>.from(
        _storage.read<Map<String, dynamic>>(_keyUserLottery) ?? {});
    assetsList.value = List.from(_storage.read<List>(_keyAssetsList) ?? []);
    token.value = _storage.read<String>(_token) ?? '';
    userWinner.value = List.from(_storage.read<List>(_keyUserWinner) ?? []);

    // 监听 obs 变量变化，并实时写入存储
    _bindStorageListeners();
    super.onInit();
  }

  /// 绑定 obs 变量的监听器到存储
  void _bindStorageListeners() {
    ever<bool>(isLoggedIn, (value) {
      _storage.write(_keyIsLoggedIn, value);
    });

    ever<Map<String, dynamic>>(userInfo, (value) {
      _storage.write(_keyUserInfo, value);
    });

    ever<Map<String, dynamic>>(prizePool, (value) {
      _storage.write(_keyPrizePool, value);
    });

    ever<Map<String, dynamic>>(userRank, (value) {
      _storage.write(_keyUserInfo, value);
    });
    ever<Map<String, dynamic>>(userLottery, (value) {
      _storage.write(_keyUserLottery, value);
    });

    ever<List>(assetsList, (value) {
      _storage.write(_keyAssetsList, value);
    });
    ever<List>(userWinner, (value) {
      _storage.write(_keyUserWinner, value);
    });
    ever<String>(token, (value) {
      _storage.write(_token, value);
    });
  }

  /// 清空所有存储数据
  Future<void> clearAll() async {
    await _storage.erase();
    isLoggedIn.value = false;
    userInfo.clear();
    assetsList.clear();
    prizePool.clear();
    userRank.clear();
    userLottery.clear();
    token.value = '';
  }

  /// 更新用户信息
  void updateUserInfo(Map<String, dynamic> newUserInfo) {
    userInfo.assignAll(newUserInfo);
  }

  /// 更新余额
  // void updateBalance(List , double amount) {
  //   assetsList = list;
  // }
}
