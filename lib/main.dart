import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fluro/fluro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_pages.dart';
import 'localization_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //  Fluro 路由
  final router = FluroRouter();

  @override
  Widget build(BuildContext context) {
    // 配置路由
    AppPages.configureRoutes(router);
    return ScreenUtilInit(
      // 屏幕适配
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Airdrop App',
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          locale: LocalizationService.locale ??
              LocalizationService.fallbackLocale, // 使用设备语言
          fallbackLocale: LocalizationService.fallbackLocale, // 设置回退语言
          translations: LocalizationService(), // 设置语言翻译服务
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF000000), // 全局背景颜色
            appBarTheme: const AppBarTheme(
              color: Color(0xFF000000), // 设置 AppBar 背景颜色
            ),
            // 使用 GoogleFonts 设置全局字体
            textTheme: GoogleFonts.figtreeTextTheme(
              Theme.of(context).textTheme,
            ),
            fontFamily: "Figtree",
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
          ),
        );
      },
    );
  }
}
