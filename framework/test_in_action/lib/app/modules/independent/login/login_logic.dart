import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/routes/go_router_configuration.dart';
import 'package:test_in_action/services/auth_service.dart';

import 'login_state.dart';

class LoginLogicBack extends GetxController {
  final LoginState state = LoginState();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final afterSuccessfulLogin = Routes.home.obs;

  void updateAfterSuccessfulLogin(String? str) =>
      afterSuccessfulLogin.value = str ?? Routes.home;

  void login(BuildContext context) {
    AuthService.to
        .login(usernameTextController.text, passwordTextController.text)
        .then((value) {
      if (value) {
        final thenTo = afterSuccessfulLogin.value;
        if (thenTo != null) {
          GoRouter.of(context).go(thenTo);
        } else {
          GoRouter.of(context).go(Routes.profile);
        }
      }
    });
  }
}
