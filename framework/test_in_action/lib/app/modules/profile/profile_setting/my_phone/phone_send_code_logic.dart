import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:test_in_action/app/components/business/send_code/send_code_logic.dart';
import 'package:test_in_action/app/components/form_builder/predefined/predefined.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';

class PhoneSendCodeLogic extends SendCodeLogic {
  @override
  String get username => formKey.currentState?.fields['Phone']?.value!;

  @override
  Future<String?> goToOtpView() async {
    /// 使用otp页面进行验证, 如果验证成功, 会携带token值返回
    String? token = await GoRouterNavigationHelper.pushNamed(
      WelcomeRouterDefine.otp.name,
      queryParameters: buildOtpQueryParameters(),
    );
    return token;
  }

  @override
  List<Widget> get children {
    return [
      PredefinedTextField(
        formKey: formKey,
        name: "Phone",
        labelText: "Phone",
        validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(), FormBuilderValidators.integer()],
        ),
      ),
    ];
  }
}
