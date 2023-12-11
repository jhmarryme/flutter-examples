import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/services/repository/global_repository.dart';

class GlobalService extends GetxService {
  late final GlobalRepository globalRepository;

  GlobalService() {
    globalRepository = GlobalRepository();
  }

  static GlobalService get to => Get.find();

  /// 加载当前主题
  ThemeMode get loadTheme => globalRepository.getTheme();

  /// 加载当前语言
  Locale get loadLocale => globalRepository.getLocale();

  /// 更改当前主题
  ThemeMode chaneThemeModel(String? value) {
    final themeMode = globalRepository.matchThemeMode(value);
    Get.changeThemeMode(themeMode);
    globalRepository.setTheme(themeMode);
    return themeMode;
  }

  /// 更改当前语言
  Locale changeLanguage(String? value) {
    final locale = globalRepository.matchLocale(value);
    Get.updateLocale(locale);
    globalRepository.setLanguage(locale.languageCode);
    return locale;
  }
}
