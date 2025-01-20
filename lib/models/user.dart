class UserModel {
  int code;
  String message;
  UserInfo data;

  UserModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      code: json['code'],
      message: json['message'],
      data: UserInfo.fromJson(json['data']),
    );
  }
}

class UserInfo {
  String userId;
  String nickName;
  String avatar;
  String tgId;
  String inviteCode;
  int inviteCount;
  bool giftShow;
  int basicTaskFinish;
  int basicTaskFinishTime;
  int hasInviter;
  bool quizeFinished;
  dynamic email;
  int isEmailVerified;
  int isSetPassword;
  int initialized;

  UserInfo({
    required this.userId,
    required this.nickName,
    required this.avatar,
    required this.tgId,
    required this.inviteCode,
    required this.inviteCount,
    required this.giftShow,
    required this.basicTaskFinish,
    required this.basicTaskFinishTime,
    required this.hasInviter,
    required this.quizeFinished,
    required this.email,
    required this.isEmailVerified,
    required this.isSetPassword,
    required this.initialized,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json['userId'] ?? "",
      nickName: json['nickName'] ?? "",
      avatar: json['avatar'] ?? "",
      tgId: json['tgId'] ?? "",
      inviteCode: json['inviteCode'] ?? "",
      inviteCount: json['inviteCount'] ?? "",
      giftShow: json['giftShow'] ?? false,
      basicTaskFinish: json['basicTaskFinish'] ?? 0,
      basicTaskFinishTime: json['basicTaskFinishTime'] ?? 0,
      hasInviter: json['hasInviter'] ?? 0,
      quizeFinished: json['quizeFinished'] ?? false,
      email: json['email'] ?? "",
      isEmailVerified: json['isEmailVerified'] ?? 0,
      isSetPassword: json['isSetPassword'] ?? false,
      initialized: json['initialized'] ?? 1,
    );
  }
}
