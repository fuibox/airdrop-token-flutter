class WbpactivityModel {
  int code;
  String message;
  List<Wbpactivity> data;

  WbpactivityModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory WbpactivityModel.fromJson(Map<String, dynamic> json) {
    List<Wbpactivity> wbpactivityData = [];
    if (json['data'] != null) {
      (json['data'] as List<dynamic>).forEach((item) {
        wbpactivityData.add(Wbpactivity.fromJson(item));
      });
    }
    return WbpactivityModel(
      code: json['code'],
      message: json['message'],
      data: wbpactivityData,
    );
  }
}

class Wbpactivity {
  int activityId;
  String activityTitle;
  String activityLogo;
  int awardAssetId;
  String awardAssetName;
  String awardAssetIcon;
  String awardIconLogo;
  String awardAmount;
  int curJoin;
  int maxJoin;
  int buyLimit;
  int startUtcTime;
  int endUtcTime;
  int assetId;
  String assetIcon;
  String assetExpense;
  dynamic winTgId;
  dynamic winNumber;
  bool isPickup;
  bool isMeme;
  String type;
  bool isEnd;
  int buyAmount;

  Wbpactivity({
    required this.activityId,
    required this.activityTitle,
    required this.activityLogo,
    required this.awardAssetId,
    required this.awardAssetName,
    required this.awardAssetIcon,
    required this.awardIconLogo,
    required this.awardAmount,
    required this.curJoin,
    required this.maxJoin,
    required this.buyLimit,
    required this.startUtcTime,
    required this.endUtcTime,
    required this.assetId,
    required this.assetIcon,
    required this.assetExpense,
    required this.winTgId,
    required this.winNumber,
    required this.isPickup,
    required this.isMeme,
    required this.type,
    required this.isEnd,
    required this.buyAmount,
  });

  factory Wbpactivity.fromJson(Map<String, dynamic> json) {
    return Wbpactivity(
      activityId: json['activityId'],
      activityTitle: json['activityTitle'],
      activityLogo: json['activityLogo'],
      awardAssetId: json['awardAssetId'],
      awardAssetName: json['awardAssetName'],
      awardAssetIcon: json['awardAssetIcon'],
      awardIconLogo: json['awardIconLogo'],
      awardAmount: json['awardAmount'],
      curJoin: json['curJoin'],
      maxJoin: json['maxJoin'],
      buyLimit: json['buyLimit'],
      startUtcTime: json['startUtcTime'],
      endUtcTime: json['endUtcTime'],
      assetId: json['assetId'],
      assetIcon: json['assetIcon'],
      assetExpense: json['assetExpense'],
      winTgId: json['winTgId'],
      winNumber: json['winNumber'],
      isPickup: json['isPickup'],
      isMeme: json['isMeme'],
      type: json['type'],
      isEnd: json['isEnd'],
      buyAmount: int.parse(json['buyAmount'].toString()),
    );
  }
}
