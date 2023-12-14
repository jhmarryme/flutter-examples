import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum VerifyType {
  phone,
  email,
}

abstract class OtpLogic extends GetxController {
  VerifyType verifyType = VerifyType.phone;
  final username = "".obs;
  final token = "".obs;

  Future<bool> doVerify(String code);

  void saveUsername(String value) {
    username.value = value;

    /// 判断类型
    verifyType = VerifyType.phone;
  }

  void onCompleted(BuildContext context, bool success) {
    if (success) {
      Navigator.pop(context, token.value);
    }
  }
}
