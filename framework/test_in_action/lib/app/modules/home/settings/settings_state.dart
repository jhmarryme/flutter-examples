import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/routes/app_pages.dart';
import 'package:test_in_action/config/global/globa_enums.dart';
import 'package:test_in_action/config/global/theme_mode_extension.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';
import 'package:test_in_action/services/global_service.dart';

class SettingsState {
  final navigatorKeyId = "${Routes.settings}:navigator";

  final themeSelectedValue = "".obs;

  final languageSelectedValue = "".obs;

  final Map<String, String> themeMaps = {
    ThemeMode.system.value: ThemeStrings.system,
    ThemeMode.light.value: ThemeStrings.light,
    ThemeMode.dark.value: ThemeStrings.dark,
  };

  final Map<String, String> languageMaps = {
    Language.en.value: LanguageStrings.enUs,
    Language.zh.value: LanguageStrings.zhCn,
  };

  SettingsState() {
    // 由于自定义了跟随系统，get只提供了判断是否是深/浅模式，Get.theme.brightness
    // 所以从本地缓存取
    themeSelectedValue.value = GlobalService.to.loadTheme.value;
    languageSelectedValue.value = Get.locale!.languageCode;
  }
}
