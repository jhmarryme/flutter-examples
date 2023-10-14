import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../welcome_logic.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class WelcomeViewLarge extends GetView<WelcomeLogic> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: WelcomeImage()),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 300, child: LoginAndSignupBtn()),
            ],
          ),
        ),
      ],
    );
  }
}
