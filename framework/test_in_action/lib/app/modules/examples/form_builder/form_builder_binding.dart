import 'package:get/get.dart';

import 'form_builder_logic.dart';

class FormBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormBuilderLogic());
  }
}
