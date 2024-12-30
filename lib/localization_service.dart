import 'package:get/get.dart';
import 'translations/en.dart';
import 'translations/zh.dart';
import 'translations/hk.dart';
import 'translations/vi.dart';
import 'translations/ko.dart';
import 'translations/ru.dart';
import 'package:flutter/material.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': EnTranslations.en,
        'zh': ZhTranslations.zh,
        'ko': KoTranslations.ko,
        'vi': ViTranslations.vi,
        'hk': HkTranslations.hk,
        'ru': RuTranslations.ru,
      };

  // 设置默认语言
  static Locale? get locale => Get.deviceLocale; // 根据设备语言自动切换
  static Locale get fallbackLocale => const Locale('en'); // 默认回退语言
}
