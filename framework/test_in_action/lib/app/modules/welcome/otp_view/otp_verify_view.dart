import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/otp/otp.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';

import 'otp_verify_logic.dart';

class OtpVerifyView extends GetBuilderView<OtpVerifyLogic> {
  const OtpVerifyView({super.key, required this.username});

  final String username;

  @override
  void beforeBuild() {
    final logic = OtpVerifyLogic();
    logic.saveUsername(username);
    Get.lazyPut(() => logic);
  }

  @override
  Widget doBuild(BuildContext context) {
    return const OtpPage<OtpVerifyLogic>();
  }
}
