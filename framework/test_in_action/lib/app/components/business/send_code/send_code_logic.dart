import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';

abstract class SendCodeLogic extends GetxController {
  /// 表单key
  final formKey = GlobalKey<FormBuilderState>();

  /// phone or email
  String get username;

  /// 表单组件
  List<Widget> get children;

  /// 创建请求map
  buildOtpQueryParameters() {
    final Map<String, dynamic> queryParameters = <String, dynamic>{};
    queryParameters[WelcomeRouterDefine.otpParamUsername] = username;
    return queryParameters;
  }

  /// 创建请求map
  buildSuccessQueryParameters() {
    final Map<String, dynamic> queryParameters = <String, dynamic>{};
    queryParameters[WelcomeRouterDefine.successParamText] = username;
    return queryParameters;
  }

  /// 表单提交事件
  void onSubmit() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      String? token = await goToOtpView();
      // token存在即验证成功, 进入成功逻辑
      if (token?.isNotEmpty ?? false) {
        onOtpVerifySuccess(token);
      }
    }
  }

  /// 重写该方法自定义返回逻辑
  void onOtpVerifySuccess(String? token) {
    /// 默认成功验证后进入 中转页
    GoRouterNavigationHelper.pushNamed(
      WelcomeRouterDefine.success.name,
      queryParameters: buildSuccessQueryParameters(),
    );
  }

  /// 使用otp页面进行验证, 如果验证成功, 会携带token值返回
  Future<String?> goToOtpView();
}
