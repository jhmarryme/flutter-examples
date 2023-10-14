import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/routes/app_pages.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final afterSuccessfulLogin = Routes.home.obs;

  void updateAfterSuccessfulLogin(String? str) =>
      afterSuccessfulLogin.value = str ?? Routes.home;
}
