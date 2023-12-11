import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/background.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart';

import 'sign_up_logic.dart';
import 'views/sign_up_view_large.dart';
import 'views/sign_up_view_small.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SignUpLogic>();
    final state = Get.find<SignUpLogic>().state;

    return const Background(
      child: SingleChildScrollView(
        child: ResponsiveWidgetBuilder(
          mobile: SignUpViewSmall(),
          tablet: SignUpViewLarge(),
          desktop: SignUpViewLarge(),
        ),
      ),
    );
  }
}
