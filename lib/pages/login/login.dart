import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取LoginController实例
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
                    margin: EdgeInsets.only(top: 46.h, bottom: 12.h),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 64.h,
                      width: 64.w,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 95.h),
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
                        margin: EdgeInsets.only(bottom: 8.h),
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

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 0.w),
                          child: DropdownButton<String>(
                            value: "+1", // 默认国家区号
                            items: <String>["+1", "+86", "+44", "+33"]
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    SizedBox(width: 8.w),
                                    Text(value),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {},
                            underline: SizedBox(),
                          ),
                        ),
                        // 手机号
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              // 更新手机号
                              loginController.setPhoneNumber(value);
                            },
                            controller: TextEditingController(
                                text: loginController.phoneNumber.value),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Please enter phone number",
                              hintStyle: TextStyle(
                                  color: Color(0xFFBFBFBF), fontSize: 16.sp),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 14.h),
                            ),
                          ),
                        ),
                        // 删除按钮
                        Obx(() {
                          return loginController.phoneNumber.value.isNotEmpty
                              ? IconButton(
                                  icon: Icon(Icons.clear, color: Colors.grey),
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
                        margin: EdgeInsets.only(bottom: 8.h, top: 16.h),
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
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) {
                                      // loginController.setOtp(value);
                                    },
                                    controller: TextEditingController(
                                        text: loginController.otp.value),
                                    decoration: InputDecoration(
                                      hintText: "",
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 14.h),
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
                                            loginController.startCountdown();
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
                  Container(
                    margin: EdgeInsets.only(top: 40.h, bottom: 88.h),
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.submitLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD99621),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Register/Login',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 24.w),
                        child: Image.asset(
                          'assets/images/ic_google.png',
                          height: 44.h,
                          width: 44.w,
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/images/ic_x.png',
                          height: 44.h,
                          width: 44.w,
                        ),
                      )
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
