import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/routes/go_router_configuration.dart';
import 'package:test_in_action/app/routes/router_define.dart';
import 'package:test_in_action/services/auth_service.dart';
import 'package:test_in_action/utils/log_utils.dart';

class LoginLogic extends GetxController {
  final String? afterSuccessfulLogin;
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  LoginLogic({this.afterSuccessfulLogin});

  void login() {
    final context = GDNavigatorObserver.instance.navigator?.context;
    AuthService.to
        .login(usernameTextController.text, passwordTextController.text)
        .then((value) {
      if (value) {
        String nextLocation =
            afterSuccessfulLogin ?? RouterDefine.profile.route;
        LogUtil.d("login success, ready to go $nextLocation");
        GoRouter.of(context!).go(nextLocation);
      }
    });
  }
}
