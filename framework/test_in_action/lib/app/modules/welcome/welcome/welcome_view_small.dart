import 'package:flutter/material.dart';

import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class WelcomeViewSmall extends StatelessWidget {
  const WelcomeViewSmall({super.key});

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
