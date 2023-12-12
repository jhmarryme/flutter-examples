import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_in_action/services/service.dart';
import 'package:window_manager/window_manager.dart';

import 'dio_config.dart';
import 'easy_loading_config.dart';

/// runApp前需要完成的初始化操作
Future<void> beforeRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 必须加上这一行。
  await windowManager.ensureInitialized();
  await GetStorage.init(DefaultStorageService.boxKey);
  await GetStorage.init(FooStorageService.boxKey);

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(800, 600),
    size: Size(1280, 720),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  Get.put(await DefaultStorageService().init());
  Get.put(await FooStorageService().init());
  Get.put(GlobalService());
  Get.put(AuthService());
}

/// runApp后需要完成的初始化操作
void afterRunApp() {
  initDio();
  configEasyLoading();
}
