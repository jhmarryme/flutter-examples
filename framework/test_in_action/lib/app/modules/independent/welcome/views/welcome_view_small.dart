import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../welcome_logic.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class WelcomeViewSmall extends GetView<WelcomeLogic> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WelcomeImage(),
        Row(
          children: [
            Spacer(flex: 2),
            Expanded(flex: 5, child: LoginAndSignupBtn()),
            Spacer(flex: 2),
          ],
        ),
      ],
    );
  }
}
