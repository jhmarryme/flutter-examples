import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/send_code/send_code_page.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';

import 'email_send_code_logic.dart';

class EmailSendCodeView extends GetBuilderView<EmailSendCodeLogic> {
  const EmailSendCodeView({Key? key}) : super(key: key);

  @override
  void beforeBuild() {
    Get.lazyPut(() => EmailSendCodeLogic());
  }

  @override
  Widget doBuild(BuildContext context) {
    return SendCodePage<EmailSendCodeLogic>();
  }
}
