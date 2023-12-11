import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_logic.dart';
import 'components/login_screen_top_image.dart';

class LoginViewLarge extends GetView<LoginLogicBack> {
  const LoginViewLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateAfterSuccessfulLogin(context.params['then']);
    return const Row(
      children: [
        Expanded(child: LoginScreenTopImage()),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(width: 300, child: LoginFormBack())],
          ),
        ),
      ],
    );
  }
}
