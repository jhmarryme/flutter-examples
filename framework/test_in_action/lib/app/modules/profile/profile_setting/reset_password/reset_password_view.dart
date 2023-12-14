import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';

import 'reset_password_logic.dart';

class ResetPasswordView extends GetBuilderView {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  void beforeBuild() {
    Get.lazyPut(() => ResetPasswordLogic());
  }

  @override
  Widget doBuild(BuildContext context) {
    // TODO: implement doBuild
    throw UnimplementedError();
  }
}
