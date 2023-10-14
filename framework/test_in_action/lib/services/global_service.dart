import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/services/storage/global_repository.dart';

class GlobalService extends GetxService {
  static GlobalService get to => Get.find();

  ThemeMode get loadTheme => globalRepository.getTheme();

  Locale get loadLocale => globalRepository.getLocale();

  final GlobalRepository globalRepository = GlobalRepository();

  ThemeMode chaneThemeModel(String? value) {
    final themeMode = globalRepository.matchThemeMode(value);
    Get.changeThemeMode(themeMode);
    globalRepository.setTheme(themeMode);
    return themeMode;
  }

  Locale changeLanguage(String? value) {
    final locale = globalRepository.matchLocale(value);
    Get.updateLocale(locale);
    globalRepository.setLanguage(locale.languageCode);
    return locale;
  }
}
