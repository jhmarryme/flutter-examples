import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US/en_us_translation.dart';
import 'zh_CN/zh_cn_translation.dart';

class LocalizationService extends Translations {
  // prevent creating instance
  LocalizationService._();

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance ??= LocalizationService._();
    return _instance!;
  }

  // default language
  // todo change the default language
  static Locale defaultLanguage = supportedLanguages['en']!;

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'zh': const Locale('zh', 'CN'),
  };

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    // todo add your English font families (add to assets/fonts, pubspec and name it here) default is poppins for english and cairo for arabic
    'en': const TextStyle(fontFamily: 'Poppins'),
    'ar': const TextStyle(fontFamily: 'Cairo'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'ar_AR': zhCn,
      };

  /// check if the language is supported
  static isLanguageSupported(String languageCode) =>
      supportedLanguages.keys.contains(languageCode);
}
