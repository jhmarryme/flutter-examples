import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/nested_scroll_view/nested_scroll_view_page.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/nested_scroll_view/nested_scroll_view_page_binding.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart'
    as responsive;
import 'package:test_in_action/app/routes/app_pages.dart';
import 'package:test_in_action/config/global/theme_mode_extension.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';
import 'package:test_in_action/services/global_service.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'settings_state.dart';

class SettingsLogic extends GetxController {
  final SettingsState state = SettingsState();

  /// 这个方法可以考虑抽一下
  void pushPage(String value) {
    final nested = !responsive.isMobile(Get.overlayContext!);
    if (nested) {
      // 子路由区域打开
      Get.keys[state.navigatorKeyId]!.navigatorKey.currentState
          ?.pushNamed(value);
    } else {
      // 新窗口打开
      Get.toNamed(value);
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.login) {
      return GetPageRoute(
        settings: settings,
        page: AppPages.dashboardRoute.page,
        transition: Transition.rightToLeftWithFade,
        bindings: AppPages.dashboardRoute.bindings,
      );
    } else if (settings.name == Routes.profile) {
      return GetPageRoute(
        settings: settings,
        middlewares: AppPages.unknownRoute.middlewares,
        page: AppPages.unknownRoute.page,
        binding: AppPages.unknownRoute.binding,
        transition: Transition.fadeIn,
      );
    } else if (settings.name == 'test') {
      return GetPageRoute(
        settings: settings,
        page: () => NestedScrollViewPage(),
        binding: NestedScrollViewPageBinding(),
        transition: Transition.fadeIn,
      );
    }
    // 这里应该返回404
    return GetPageRoute(
      settings: settings,
      page: AppPages.unknownRoute.page,
      binding: AppPages.unknownRoute.binding,
      transition: Transition.fadeIn,
    );
  }

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
