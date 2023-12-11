import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final String? afterSuccessfulLogin;

  LoginLogic(this.afterSuccessfulLogin);

//
  // void updateAfterSuccessfulLogin(String? str) =>
  //     afterSuccessfulLogin.value = str ?? Routes.home;
}
