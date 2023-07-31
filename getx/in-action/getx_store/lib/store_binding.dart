import 'package:get/get.dart';
import 'package:getx_store/controllers/store_controller.dart';

import 'services/review_repository.dart';
import 'services/store_provider.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController(
        repository: ReviewRepository(storeProvider: StoreProvider())));
  }
}
