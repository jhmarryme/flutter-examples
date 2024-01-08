import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/background.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart';

import 'login_logic.dart';
import 'login_view_large.dart';
import 'login_view_small.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, this.redirectLocation});

  final String? redirectLocation;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginLogic>(
        () => LoginLogic(afterSuccessfulLogin: redirectLocation));
    return const Background(
      child: SingleChildScrollView(
        child: ResponsiveWidgetBuilder(
          mobile: LoginViewSmall(),
          tablet: LoginViewLarge(),
          desktop: LoginViewLarge(),
        ),
      ),
    );
  }
}
