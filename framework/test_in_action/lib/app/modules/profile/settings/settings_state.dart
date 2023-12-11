import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/routes/router_define.dart';
import 'package:test_in_action/common/constants/enums/global_enums.dart';
import 'package:test_in_action/common/extensions/theme_mode_extension.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';
import 'package:test_in_action/services/global_service.dart';

class SettingsState {
  SettingsState() {
    // 由于自定义了跟随系统，get只提供了判断是否是深/浅模式，Get.theme.brightness
    // 所以从本地缓存取
    themeSelectedValue.value = GlobalService.to.loadTheme.value;
    languageSelectedValue.value = Get.locale!.languageCode;
  }

  final themeSelectedValue = "".obs;

  final languageSelectedValue = "".obs;

  final routeSelectedValue = "null".obs;

  final Map<String, String> themeMaps = {
    ThemeStrings.system: ThemeMode.system.value,
    ThemeStrings.light: ThemeMode.light.value,
    ThemeStrings.dark: ThemeMode.dark.value,
  };

  final Map<String, String> languageMaps = {
    LanguageStrings.enUs: Language.en.value,
    LanguageStrings.zhCn: Language.zh.value,
  };

  final Map<String, String> routeMaps = {
    // Routes.: Routes.profileIndex,
    "null": "null",
    ProfileRouterDefine.blank.name: ProfileRouterDefine.blank.name,
    ProfileRouterDefine.nestedScrollView.name:
        ProfileRouterDefine.nestedScrollView.name,
    ProfileRouterDefine.formBuilder.name: ProfileRouterDefine.formBuilder.name,
    ProfileRouterDefine.refresh.name: ProfileRouterDefine.refresh.name,
    ProfileRouterDefine.chart.name: ProfileRouterDefine.chart.name,
    ProfileRouterDefine.dataGridPaging.name:
        ProfileRouterDefine.dataGridPaging.name,
    ProfileRouterDefine.profileNew.name: ProfileRouterDefine.profileNew.name,
  };
}
