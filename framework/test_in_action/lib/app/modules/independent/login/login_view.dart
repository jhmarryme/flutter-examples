import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/background.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart'
    as responsive;
import 'package:test_in_action/app/modules/independent/login/views/login_view_small.dart';

import 'login_logic.dart';
import 'views/login_view_large.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    final state = Get.find<LoginLogic>().state;
    return const Background(
      child: SingleChildScrollView(
        child: responsive.WidgetBuilder(
          mobile: LoginViewSmall(),
          tablet: LoginViewLarge(),
          desktop: LoginViewLarge(),
        ),
      ),
    );
  }
}
