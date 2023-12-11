import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FooStorageService extends GetxService {
  late final GetStorage _box;

  static const String boxKey = "foo-container";

  Future<FooStorageService> init() async {
    _box = GetStorage(boxKey);
    return this;
  }

  dynamic read(String key) {
    return _box.read(key);
  }

  void write<T>(String key, T value) async {
    await _box.write(key, value);
  }

  void remove(String key) {
    _box.remove(key);
  }
}
