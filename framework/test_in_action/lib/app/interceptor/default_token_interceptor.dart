import 'package:test_in_action/app/routes/parts/go_router_navigation_helper.dart';
import 'package:test_in_action/common/http/interceptor/token_interceptor.dart';
import 'package:test_in_action/services/auth_service.dart';
import 'package:test_in_action/utils/tips_util.dart';

class DefaultTokenInterceptor extends TokenInterceptor {
  @override
  String getRefreshToken() {
    return AuthService.to.getRefreshToken;
  }

  @override
  String? doRefreshToken(String refreshToken) {
    /// todo 使用refreshToken交换accessToken
    ///
    /// todo 刷新成功后保存accessToken
    return null;
  }

  @override
  void handleNotLogin() {
    TipsUtil.dismiss();
    TipsUtil.showDialog(
      textCancel: "do nothing",
      textConfirm: "go login",
      onConfirm: () =>
          GoRouterNavigationHelper.goNamed(RouterDefine.welcome.name),
    );
  }
}
