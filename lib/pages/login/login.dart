import 'package:airdrop_flutter/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //nav
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.w, right: 0.w),
                          child: Image.asset(
                            'assets/images/nav_back.png',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 0.w, right: 0.w),
                          width: 85.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: Color(0XFF0D0900),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, right: 2.w),
                                child: Image.asset(
                                  'assets/images/ic_lang.png',
                                  width: 18.w,
                                  height: 18.h,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, right: 0.w),
                                child: Text(
                                  'English',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //logo
                  Container(
                    margin: EdgeInsets.only(top: 46.w, bottom: 12.w),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 64.w,
                      width: 64.w,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 95.w),
                    child: Text(
                      'AirDrop',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8.w),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  // phone
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    height: 48.w,
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CountryCodePicker(
                                onChanged: (CountryCode country) {
                                  loginController.areaCode.value =
                                      country.dialCode!; // 更新区号
                                },
                                padding: EdgeInsets.all(0),
                                margin: EdgeInsets.all(0),
                                initialSelection: 'US', // 默认选项
                                showCountryOnly: false, // 显示区号和国旗
                                showFlag: false, // 显示国旗
                                showFlagDialog: true, // 显示国旗对话框
                                flagDecoration: BoxDecoration(
                                  shape: BoxShape.circle, // 设置为圆形
                                ),
                                builder: (CountryCode? country) {
                                  if (country == null)
                                    return SizedBox(); // 如果没有选择任何国家，返回空的容器
                                  return Row(
                                    children: [
                                      // 显示国旗
                                      CountryCodePicker(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        showFlag: true, // 显示国旗
                                        showCountryOnly: false, // 显示区号和国旗
                                        initialSelection: 'US', // 默认国家
                                        flagDecoration: BoxDecoration(
                                          shape: BoxShape.circle, // 设置为圆形
                                        ),
                                        onChanged: (country) {
                                          loginController.areaCode.value =
                                              country.dialCode!;
                                          AppLogger.instance
                                              .d(loginController.areaCode);
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: Image.asset(
                                          'assets/images/ic_arrow.png', // 你的箭头图标路径
                                          height: 24.0, // 图标高度
                                          width: 24.0, // 图标宽度
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // phone
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              // update phone
                              loginController.setPhoneNumber(value);
                              AppLogger.instance.d(loginController.phoneNumber);
                            },
                            controller: TextEditingController(
                                text: loginController.phoneNumber.value),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly, // 只允许数字输入
                            ],
                            cursorColor: const Color(0xFFCC9533),
                            decoration: InputDecoration(
                              hintText: "Please enter phone number",
                              hintStyle: TextStyle(
                                  color: const Color(0xFFBFBFBF),
                                  fontSize: 16.sp),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 0.w),
                            ),
                          ),
                        ),
                        // 删除按钮
                        Obx(() {
                          return loginController.phoneNumber.value.isNotEmpty
                              ? IconButton(
                                  icon: Image.asset(
                                    'assets/images/ic_clean.png',
                                    height: 20.w,
                                    width: 20.w,
                                  ),
                                  onPressed: () {
                                    // loginController.setPhoneNumber('');
                                  },
                                )
                              : SizedBox();
                        }),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8.w, top: 16.w),
                        child: Text(
                          'Verification Code',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  // 获取验证码按钮
                  Obx(() {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 343.w,
                            height: 48.w,
                            decoration: BoxDecoration(
                              color: Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) {
                                      loginController.setOtp(value);
                                      AppLogger.instance.d(loginController.otp);
                                    },
                                    cursorColor: Color(0xFFCC9533),
                                    // controller: TextEditingController(
                                    //     text: loginController.otp.value),
                                    inputFormatters: [
                                      FilteringTextInputFormatter
                                          .digitsOnly, // 只允许数字输入
                                      LengthLimitingTextInputFormatter(
                                          6), // 限制最大输入长度为 6
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "",
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 16.w),
                                    ),
                                  ),
                                ),
                                // 验证码
                                Container(
                                  margin: EdgeInsets.only(right: 16.w),
                                  child: InkWell(
                                    onTap: loginController.isButtonEnabled
                                        ? () {
                                            // 获取验证码
                                            loginController.sendSmsCode();
                                          }
                                        : null,
                                    child: Text(
                                      loginController.isButtonEnabled
                                          ? 'Send again'
                                          : '${loginController.countdown}',
                                      style: TextStyle(
                                        color: Color(0xFFA66B19),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),

                  // 登录
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(top: 40.w, bottom: 88.w),
                      width: double.infinity,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFEFFD1),
                            offset: Offset(0, -3),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (loginController.phoneNumber.value.length > 0 &&
                              loginController.otp.value.length > 5) {
                            loginController.submitLogin();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              loginController.phoneNumber.value.length > 0 &&
                                      loginController.otp.value.length > 5
                                  ? Color(0xFFD99621)
                                  : Color(0XFFBCC0CC),
                          padding: EdgeInsets.symmetric(vertical: 14.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'Register/Login',
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    );
                  }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          loginController.googleLogin();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 24.w),
                          child: Image.asset(
                            'assets/images/ic_google.png',
                            height: 44.w,
                            width: 44.w,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          loginController.faceBookLogin();
                          // loginController.signInWithFacebook();
                        },
                        child: Container(
                          child: Image.asset(
                            'assets/images/ic_x.png',
                            height: 44.w,
                            width: 44.w,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
