import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/business/send_code/send_code_page.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';
import 'package:test_in_action/app/modules/profile/profile_setting/my_phone/phone_send_code_logic.dart';

class PhoneSendCodeView extends GetBuilderView<PhoneSendCodeLogic> {
  const PhoneSendCodeView({Key? key}) : super(key: key);

  @override
  void beforeBuild() {
    Get.lazyPut(() => PhoneSendCodeLogic());
  }

  @override
  Widget doBuild(BuildContext context) {
    return SendCodePage<PhoneSendCodeLogic>();
  }
}
