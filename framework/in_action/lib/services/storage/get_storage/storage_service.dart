import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage _box = GetStorage();

  Future<StorageService> init() async {
    _box = GetStorage();
    debugPrint("init ---------------");
    return this;
  }

  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  void remove(String key) {
    _box.remove(key);
  }
}
