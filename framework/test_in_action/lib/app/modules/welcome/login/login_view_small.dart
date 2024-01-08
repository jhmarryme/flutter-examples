import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';
import 'login_logic.dart';

class LoginViewSmall extends GetView<LoginLogic> {
  const LoginViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(flex: 8, child: LoginForm()),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
