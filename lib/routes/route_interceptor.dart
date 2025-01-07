import 'package:airdrop_flutter/pages/earn/earn.dart';
import 'package:airdrop_flutter/pages/home/home.dart';
import 'package:airdrop_flutter/pages/pay/pay.dart';
import 'package:airdrop_flutter/pages/tasks/tasks.dart';
import 'package:fluro/fluro.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app_pages.dart';
import '../pages/login/login.dart';

// 认证服务
class AuthService {
  static bool isLoggedIn() {
    // 判断用户是否登录
    return false; // 模拟未登录状态
  }
}

class RouteInterceptor {
  static void configureInterceptor(FluroRouter router) {
    // 路由未找到时的处理器
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      // 找不到页面时重定向到登录页面
      Get.offAll(() => LoginScreen());
      return;
    });

    // 定义需要拦截的路由，并且检查是否需要认证
    _defineAuthProtectedRoutes(router);
  }

  static void _defineAuthProtectedRoutes(FluroRouter router) {
    // 需要认证的页面
    List<String> protectedRoutes = [
      AppPages.home,
      AppPages.pay,
      AppPages.earn,
      AppPages.tasks,
    ];

    // 配置需要认证的路由
    for (String route in protectedRoutes) {
      router.define(route, handler: Handler(handlerFunc:
          (BuildContext? context, Map<String, List<String>> params) {
        if (AuthService.isLoggedIn()) {
          // 如果用户已登录，正常跳转
          return _getPageForRoute(route); // 根据路由返回页面
        } else {
          // 如果用户未登录，重定向到登录页面
          Get.to(() => LoginScreen());
          return null; // 阻止页面跳转
        }
      }));
    }
  }

  // 根据路由返回相应的页面
  static Widget _getPageForRoute(String route) {
    switch (route) {
      case AppPages.home:
        return HomeScreen();
      case AppPages.pay:
        return PayScreen();
      case AppPages.earn:
        return EarnScreen();
      case AppPages.tasks:
        return TasksScreen();
      default:
        return HomeScreen();
    }
  }
}
