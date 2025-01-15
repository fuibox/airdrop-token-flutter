import 'package:airdrop_flutter/controllers/notification_controller.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:fluro/fluro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_pages.dart';
import 'localization_service.dart';
import 'routes/route_interceptor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 确保 Flutter 绑定初始化

  final FluroRouter router = FluroRouter();

  // 初始化路由和拦截器
  AppPages.configureRoutes(router);
  RouteInterceptor.configureInterceptor(router);

  // 使用 Get.putAsync 初始化 StorageService
  await Get.putAsync(() async {
    final storageService = StorageService();
    await storageService.onInit();
    return storageService;
  });
  Get.put(NotificationController());

  runApp(MyApp(router));
}

class MyApp extends StatelessWidget {
  final FluroRouter router;

  MyApp(this.router);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 屏幕适配初始化，设定设计图的尺寸
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Airdrop App', // 应用标题
          initialRoute: AppPages.initial, // 默认页面
          getPages: AppPages.routes, // 使用 GetX 配置的路由
          locale: LocalizationService.locale ??
              LocalizationService.fallbackLocale, // 获取当前设备语言
          fallbackLocale: LocalizationService.fallbackLocale, // 设置回退语言
          translations: LocalizationService(), // 语言翻译服务
          theme: ThemeData(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            scaffoldBackgroundColor: const Color(0xFF000000), // 设置全局背景色为黑色
            appBarTheme: const AppBarTheme(
              color: Color(0xFF000000), //  AppBar 背景颜色
            ),
            // 使用 GoogleFonts 设置全局字体
            textTheme: GoogleFonts.figtreeTextTheme(
              Theme.of(context).textTheme,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.white, // 底部导航选中的字体颜色
              unselectedItemColor: Colors.grey, // 未选中项的字体颜色
            ),
          ),
          // 配置 Fluro 路由
          onGenerateRoute: router.generator,
          builder: FlutterSmartDialog.init(),
        );
      },
    );
  }
}
