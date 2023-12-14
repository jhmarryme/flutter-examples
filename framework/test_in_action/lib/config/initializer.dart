import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_in_action/services/service.dart';

import 'dio_config.dart';
import 'easy_loading_config.dart';
import 'window_size_config.dart';

/// runApp前需要完成的初始化操作
Future<void> beforeRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(DefaultStorageService.boxKey);
  await GetStorage.init(FooStorageService.boxKey);
  await setWindowsSize();
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
