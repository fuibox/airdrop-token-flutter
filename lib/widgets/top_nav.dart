import 'package:airdrop_flutter/controllers/login_controller.dart';
import 'package:airdrop_flutter/controllers/notification_controller.dart';
import 'package:airdrop_flutter/routes/app_pages.dart';
import 'package:airdrop_flutter/ui/global_notifiication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../utils/logger.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final NotificationController notificationController = Get.find();
  LoginController loginController = Get.put(LoginController());

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
            Container(
              child: LoopScrollWidget(
                items: [
                  [for (var item in notificationController.items) item],
                ],
                itemBuilder: (context, rowIndex, index) {
                  return Container(
                    width: 217.w,
                    height: 22.w,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                        color: Color(0X33FFFFFF),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          notificationController.items[index],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0X66FFFFFF),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
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
              widget.loginController.isLoginSuccess.value
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
                    ),
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
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: Text(
              '32',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
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
                  Text(
                    '28***@gamil.com',
                    style: TextStyle(
                        color: Color(0xffffffff).withOpacity(0.8),
                        fontSize: 14.sp,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400),
                  )
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
                      Text(
                        'Felix',
                        style: TextStyle(
                            color: Color(0xffffffff).withOpacity(0.8),
                            fontSize: 14.sp,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w400),
                      ),
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
            Container(
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
                      Text(
                        '0xfffaa',
                        style: TextStyle(
                            color: Color(0xffffffff).withOpacity(0.8),
                            fontSize: 14.sp,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6.w),
                        child: Image.asset(
                          'assets/images/nav_bottom_copy.png',
                          width: 14.w,
                          height: 14.w,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
