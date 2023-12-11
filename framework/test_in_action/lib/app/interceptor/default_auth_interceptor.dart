import 'package:test_in_action/common/http/http.dart';
import 'package:test_in_action/services/auth_service.dart';

class DefaultAuthInterceptor extends AuthInterceptor {
  @override
  String getAccessToken() {
    return AuthService.to.getAccessToken;
  }
}
