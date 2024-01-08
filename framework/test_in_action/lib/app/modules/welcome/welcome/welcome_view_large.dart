import 'package:flutter/material.dart';

import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class WelcomeViewLarge extends StatelessWidget {
  const WelcomeViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(flex: 5, child: WelcomeImage()),
        Spacer(flex: 1),
        Expanded(flex: 2, child: LoginAndSignupBtn()),
        Spacer(flex: 1),
      ],
    );
  }
}
