import 'package:get/get.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';
import 'package:test_in_action/services/auth_service.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  void logout() {
    LogUtil.d("logout....");
    AuthService.to.logout();
    Get.toNamed(Routes.index);
  }
}
