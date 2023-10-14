import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sign_up_logic.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';

class SignUpViewSmall extends GetView<SignUpLogic> {
  const SignUpViewSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(flex: 8, child: SignUpForm()),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
