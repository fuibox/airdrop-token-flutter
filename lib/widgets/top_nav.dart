import 'package:airdrop_flutter/controllers/assets_details_controller.dart';
import 'package:airdrop_flutter/controllers/login_controller.dart';
import 'package:airdrop_flutter/controllers/notification_controller.dart';
import 'package:airdrop_flutter/routes/app_pages.dart';
import 'package:airdrop_flutter/service/api_user_service.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/ui/global_notifiication.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../utils/logger.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final NotificationController notificationController =
      Get.put(NotificationController());
  LoginController loginController = Get.put(LoginController());
  final StorageService storage = StorageService();

  TopNav({Key? key})
      : preferredSize = Size.fromHeight(102.w),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 102.w,
      title: Container(
        child: Column(
          children: [
            UserLoginBar(loginController: loginController),
            // notifiication
            Obx(() {
              if (storage.userWinner.value.isNotEmpty ?? false) {
                return Container(
                  child: LoopScrollWidget(
                    items: [
                      storage.userWinner.value,
                    ],
                    itemBuilder: (context, rowIndex, index) {
                      return Container(
                        height: 22.w,
                        padding: EdgeInsets.only(left: 6.w, right: 6.w),
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                            color: Color(0X33FFFFFF),
                            borderRadius: BorderRadius.circular(30.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${storage.userWinner.value[index]['wallet']} ',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0XffFFFFFF),
                              ),
                            ),
                            Text(
                              'just won ',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0XffFFFFFF),
                              ),
                            ),
                            Text(
                              '${formatNumber(storage.userWinner.value[index]['amount'], decimalPlaces: 4)} ',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0X66FFFFFF),
                              ),
                            ),
                            Image.network(
                                storage.userWinner.value[index]['icon'])
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            })
          ],
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      elevation: 0,
    );
  }
}

class UserLoginBar extends StatefulWidget {
  final bool showLogo;
  final LoginController loginController;
  final storage = Get.find<StorageService>();

  UserLoginBar(
      {super.key, this.showLogo = true, required this.loginController});

  @override
  _UserLoginBarState createState() => _UserLoginBarState();
}

class _UserLoginBarState extends State<UserLoginBar> {
  bool isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!!widget.showLogo)
            Image.asset(
              'assets/images/logo.png',
              height: 32.w,
              width: 32.w,
            ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: _buildLanguageSelectButton(),
              ),
              InkWell(
                onTap: () {},
                child: _buildChestButton(),
              ),
              Obx(() {
                return widget.storage.isLoggedIn.value
                    ? InkWell(
                        onTap: () {
                          _toggleUserInfoDialog();
                        },
                        child: Image.asset(
                          'assets/images/user_avatar.png',
                          width: 28.w,
                          height: 28.w,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          AppLogger.instance.d('login');
                          Get.toNamed(AppPages.login);
                        },
                        child: _buildLoginButton(),
                      );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelectButton() {
    return Container(
      margin: EdgeInsets.only(left: 0.w, right: 0.w),
      width: 110.w,
      height: 28.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Color(0X33FFFFFF),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w, right: 0.w),
            child: Image.asset(
              'assets/images/ic_lang.png',
              width: 18.w,
              height: 18.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w, right: 8.w),
            child: Text(
              'English',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.w, right: 0.w),
            child: Image.asset(
              'assets/images/ld_sele.png',
              width: 14.w,
              height: 14.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChestButton() {
    return Container(
      margin: EdgeInsets.only(left: 8.w, right: 8.w),
      width: 60.w,
      height: 28.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Color(0X33FFFFFF),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w, right: 3.8.w),
            child: Image.asset(
              'assets/images/nav_chest.png',
              width: 22.w,
              height: 22.w,
            ),
          ),
          Obx(() {
            return Padding(
              padding: EdgeInsets.only(left: 0.w),
              child: Text(
                '${widget.storage.userLottery.value['opportunity'] ?? 0}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: 72.w,
      height: 28.w,
      decoration: BoxDecoration(
        color: Color(0xFFCC9533),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Center(
        child: Text(
          'login'.tr,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000),
          ),
        ),
      ),
    );
  }

  void _toggleUserInfoDialog() {
    if (isDialogOpen) {
      SmartDialog.dismiss();
      setState(() {
        isDialogOpen = false;
      });
    } else {
      _showUserInfoDialog();
      setState(() {
        isDialogOpen = true;
      });
    }
  }

  void _showUserInfoDialog() {
    final storage = Get.find<StorageService>();
    AssetsDetailsController assetsDetailsController =
        Get.put(AssetsDetailsController());
    assetsDetailsController.getAssetsDepositAddress('1');
    TextEditingController _controllerName = TextEditingController();
    FocusNode _focusNodeName = FocusNode();
    _controllerName.text = widget.storage.userInfo['nickName'] ?? '';

    _focusNodeName.addListener(() {
      if (!_focusNodeName.hasFocus) {
        // 当失去焦点时，即用户输入结束，发送请求
        userService.UpdateUserName(_controllerName.text).then((res) async {
          if (res.data['code'] == 200) {
            SmartDialog.showToast('SUCCESS', alignment: Alignment.center);
            final result = await userService.UserInfo();
            final storage = Get.find<StorageService>();

            storage.userInfo.value =
                result.data['data'] as Map<String, dynamic>;
          } else {
            SmartDialog.showToast('${res.data['message']}',
                alignment: Alignment.center);
          }
        });
      }
    });

    SmartDialog.showAttach(
      targetContext: context,
      alignment: Alignment.bottomCenter,
      clickMaskDismiss: false,
      usePenetrate: true,
      builder: (_) => Container(
        height: 216.w,
        width: double.infinity,
        padding: EdgeInsets.only(left: 17.w, right: 17.w),
        decoration: BoxDecoration(
          color: Color(0xff1a1a1a),
          borderRadius: BorderRadius.only(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 48.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account:',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14.sp,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400),
                  ),
                  Obx(() {
                    return Text(
                      '${widget.storage.userInfo['email'] ?? ''}',
                      style: TextStyle(
                          color: Color(0xffffffff).withOpacity(0.8),
                          fontSize: 14.sp,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w400),
                    );
                  })
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 48.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nickname:',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14.sp,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      // Obx(() {
                      //   return
                      Container(
                        width: 100.w,
                        child: TextField(
                          style: TextStyle(
                              color: Color(0xffffffff).withOpacity(0.8)),
                          onChanged: (value) {
                            // update phone
                            AppLogger.instance.d(value);
                          },
                          controller: _controllerName,
                          focusNode: _focusNodeName,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [],
                          cursorColor: const Color(0xFFCC9533),
                          decoration: InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(
                                color: const Color(0xFFBFBFBF),
                                fontSize: 16.sp),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 0.w),
                          ),
                        ),
                      ),
                      // }),
                      // Text(
                      //   '${widget.storage.userInfo['nickName'] ?? ''}',
                      //   style: TextStyle(
                      //       color: Color(0xffffffff).withOpacity(0.8),
                      //       fontSize: 14.sp,
                      //       fontFamily: 'Figtree',
                      //       fontWeight: FontWeight.w400),
                      // );
                      // }),
                      Container(
                        margin: EdgeInsets.only(left: 6.w),
                        child: Image.asset(
                          'assets/images/nav_bottom_edit.png',
                          width: 14.w,
                          height: 14.w,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Obx(() {
              return Container(
                width: double.infinity,
                height: 48.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wallet:',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 14.sp,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100.w,
                          child: Text(
                            '${assetsDetailsController.depositData['address'] ?? ''}',
                            style: TextStyle(
                                color: Color(0xffffffff).withOpacity(0.8),
                                fontSize: 14.sp,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: assetsDetailsController
                                        .depositData['address'] ??
                                    ''));
                            SmartDialog.showToast('Copy SUCCESS',
                                alignment: Alignment.center);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 6.w),
                            child: Image.asset(
                              'assets/images/nav_bottom_copy.png',
                              width: 14.w,
                              height: 14.w,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
            InkWell(
              onTap: () {
                SmartDialog.dismiss();
                storage.clearAll();
              },
              child: Container(
                  width: 343.w,
                  height: 48.w,
                  margin: EdgeInsets.only(top: 8.w),
                  decoration: BoxDecoration(
                      color: Color(0XFFced3d9).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(width: 1.w, color: Color(0XFF000000))),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border(
                            top: BorderSide(
                                width: 3.w,
                                color: Color(0XFFFfffff).withOpacity(0.2)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log out',
                          style: TextStyle(
                              color: Color(0XFFffffff),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
