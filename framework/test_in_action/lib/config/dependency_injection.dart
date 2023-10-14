import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_in_action/services/global_service.dart';
import 'package:test_in_action/services/storage/get_storage/default_storage_service.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init(DefaultStorageService.boxKey);
    Get.put(await DefaultStorageService().init());
    Get.put(GlobalService());
  }
}
