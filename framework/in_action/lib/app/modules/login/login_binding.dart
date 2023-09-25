import 'package:get/get.dart';
import 'package:in_action/app/modules/login/login_logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginLogic());
    print('--------------LoginLogic put success');
  }
}
