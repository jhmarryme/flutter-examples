import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/config/global/globa_enums.dart';
import 'package:test_in_action/config/global/theme_mode_extension.dart';
import 'package:test_in_action/config/translations/localization_service.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'get_storage/default_storage_service.dart';

enum GlobalStorageKey {
  themeMode("global_themeMode"),
  language("global_language"),
  ;

  final String key;

  const GlobalStorageKey(this.key);
}

class GlobalRepository {
  final DefaultStorageService _storageService =
      Get.find<DefaultStorageService>();

  void setTheme(ThemeMode themeMode) {
    _storageService.write(GlobalStorageKey.themeMode.key, themeMode.value);
  }

  void setLanguage(String language) {
    _storageService.write(GlobalStorageKey.language.key, language);
  }

  ThemeMode getTheme() {
    final String theme =
        _storageService.read(GlobalStorageKey.themeMode.key) ?? '';
    LogUtil.d("load local theme: $theme");
    return matchThemeMode(theme);
  }

  Locale getLocale() {
    final String language =
        _storageService.read(GlobalStorageKey.language.key) ?? '';
    LogUtil.d("load local language: $language");

    return LocalizationService.supportedLanguages[language] ??
        LocalizationService.defaultLanguage;
  }

  Language matchLanguage(String? value) {
    switch (value) {
      case 'en':
        return Language.en;
      case 'zh':
        return Language.zh;
      default:
        return Language.zh;
    }
  }

  Locale matchLocale(String? value) {
    return LocalizationService.supportedLanguages[value ?? ''] ??
        LocalizationService.defaultLanguage;
  }

  ThemeMode matchThemeMode(String? value) {
    switch (value) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
