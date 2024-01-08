import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';
import 'login_logic.dart';

class LoginViewLarge extends GetView<LoginLogic> {
  const LoginViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: LoginScreenTopImage()),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(width: 300, child: LoginForm())],
          ),
        ),
      ],
    );
  }
}
