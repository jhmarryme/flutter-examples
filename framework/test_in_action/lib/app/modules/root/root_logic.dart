import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';
import 'package:test_in_action/services/auth_service.dart';
import 'package:test_in_action/utils/log_utils.dart';

class RootLogic extends GetxController {
  RootLogic();

  void logout() {
    LogUtil.d("logout....");
    AuthService.to.logout();
    GoRouterNavigationHelper.replaceNamed(RouterDefine.welcome.name);
  }

  void doLogout(BuildContext context) {
    GoRouter.of(context).replaceNamed(RouterDefine.welcome.name);
  }
}
