import 'package:test_in_action/common/http/interceptor/token_interceptor.dart';
import 'package:test_in_action/services/auth/auth_service.dart';

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
}
