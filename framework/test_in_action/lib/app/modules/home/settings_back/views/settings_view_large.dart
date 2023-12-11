import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/modules/home/settings/settings_logic.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';

import 'settings_view_small.dart';

class SettingsViewLarge extends GetView<SettingsLogic> {
  SettingsViewLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    return GetBuilder<SettingsLogic>(builder: (logic) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(flex: 1, child: SettingsViewSmall()),
            const VerticalDivider(thickness: 1, width: 11),
            Expanded(
              flex: 1,
              child: Navigator(
                key: Get.nestedKey(state.navigatorKeyId)?.navigatorKey,
                initialRoute: Routes.login,
                onGenerateRoute: controller.onGenerateRoute,
              ),
            ),
            const VerticalDivider(thickness: 1, width: 11),
            Expanded(
              flex: 1,
              child: Navigator(
                key: Get.nestedKey(state.navigatorKeyId2)?.navigatorKey,
                initialRoute: Routes.login,
                onGenerateRoute: controller.onGenerateRoute,
              ),
            )
          ],
        ),
      );
    });
  }
}
