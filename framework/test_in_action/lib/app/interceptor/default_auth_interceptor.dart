import 'package:test_in_action/services/auth/auth_service.dart';

import '../../common/http/interceptor/auth_interceptor.dart';

class DefaultAuthInterceptor extends AuthInterceptor {
  @override
  String getAccessToken() {
    return AuthService.to.getAccessToken;
  }
}
