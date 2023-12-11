import 'package:get/get.dart';
import 'package:test_in_action/app/components/data_table_2/page/data_controller.dart';

class DataTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
  }
}
