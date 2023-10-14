import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_logic.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginViewSmall extends GetView<LoginLogic> {
  const LoginViewSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateAfterSuccessfulLogin(context.params['then']);
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
