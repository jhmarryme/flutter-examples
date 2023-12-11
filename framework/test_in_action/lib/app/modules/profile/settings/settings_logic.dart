import 'package:get/get.dart';
import 'package:test_in_action/common/extensions/theme_mode_extension.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';
import 'package:test_in_action/services/global_service.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'settings_state.dart';

class SettingsLogic extends GetxController {
  final SettingsState state = SettingsState();

  void changeTheme(String? value) {
    final themeMode = GlobalService.to.chaneThemeModel(value);
    state.themeSelectedValue.value = themeMode.value;
  }

  void changeLanguage(String? value) {
    var locale = GlobalService.to.changeLanguage(value);
    LogUtil.d(ThemeStrings.themeMode.tr);
    state.languageSelectedValue.value = locale.languageCode ?? '';
  }
}
