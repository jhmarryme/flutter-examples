import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/common/constants/style_constants.dart';

import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
import 'sign_up_logic.dart';

class SignUpViewLarge extends GetView<SignUpLogic> {
  const SignUpViewLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: SignUpScreenTopImage()),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 450, child: SignUpForm()),
              SizedBox(height: StyleConstants.defaultPadding / 2),
              // SocalSignUp()
            ],
          ),
        )
      ],
    );
  }
}
