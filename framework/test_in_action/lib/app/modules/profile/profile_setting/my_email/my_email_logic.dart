import 'package:get/get.dart';
import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';
import 'package:test_in_action/utils/log_utils.dart';

class MyEmailLogic extends GetxController {
  buildOtpQueryParameters(String username) {
    final Map<String, dynamic> queryParameters = <String, dynamic>{};
    queryParameters[WelcomeRouterDefine.otpParamUsername] = username;
    return queryParameters;
  }

  buildSuccessQueryParameters(String username) {
    final Map<String, dynamic> queryParameters = <String, dynamic>{};
    queryParameters[WelcomeRouterDefine.successParamText] = username;
    return queryParameters;
  }

  Future<void> goToOtpView(String username) async {
    /// 使用otp页面进行验证, 如果验证成功, 会携带token值返回
    String? token = await GoRouterNavigationHelper.pushNamed(
        WelcomeRouterDefine.otp.name,
        queryParameters: buildOtpQueryParameters(username));
    if (token?.isNotEmpty ?? false) {
      GoRouterNavigationHelper.pushNamed(WelcomeRouterDefine.success.name,
          queryParameters: buildSuccessQueryParameters(username));
    }
    LogUtil.d('$token');
  }
}
