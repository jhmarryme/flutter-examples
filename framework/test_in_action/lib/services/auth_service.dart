import 'package:get/get.dart';
import 'package:test_in_action/common/http/dio_utils.dart';
import 'package:test_in_action/common/http/request_helper.dart';
import 'package:test_in_action/models/auth/login_request_entity.dart';
import 'package:test_in_action/models/auth/login_result_entity.dart';
import 'package:test_in_action/models/auth/token_entity.dart';
import 'package:test_in_action/services/repository/auth_repository.dart';
import 'package:test_in_action/utils/log_utils.dart';
import 'package:test_in_action/utils/other_utils.dart';

import 'state/auth_state.dart';

class AuthService extends GetxService {
  late final AuthState state;

  late final AuthRepository authRepository;

  static AuthService get to => Get.find();

  AuthService() {
    state = AuthState();
    authRepository = AuthRepository();
  }

  /// 获取token
  String get getAccessToken {
    if (state.token.value.isBlank == false) {
      return state.token.value;
    }
    final accessTokenInCache = authRepository.getToken()?.accessToken;
    state.token.value = accessTokenInCache.nullSafe;
    return accessTokenInCache.nullSafe;
  }

  /// 获取刷新token
  String get getRefreshToken {
    if (state.token.value.isBlank == false) {
      return state.token.value;
    }
    return (authRepository.getToken()?.refreshToken).nullSafe;
  }

  /// 当前是否登录
  bool get isLogin {
    return getAccessToken.isBlank == false;
  }

  /// 登录
  Future<bool> login(String username, String password) async {
    final loginRequest = LoginRequestEntity();
    loginRequest.username = username;
    loginRequest.password = password;
    LoginResultEntity? user =
        await RequestHelper.requestNetwork<LoginResultEntity>(
      Method.post,
      params: loginRequest.toJson(),
      url:
          "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/login?apipost_id=67aebd",
    );
    if (user == null || user.userId == null || user.token == null) {
      // TipsUtil.showToast("登陆失败");
      return false;
    }
    LogUtil.d('login success result: ${user.toJson()}');
    saveLoginInfo(user);
    return true;
  }

  /// 清空缓存
  void logout() {
    state.token.value = "";
    state.isLoggedIn.value = false;
    authRepository.logout();
    LogUtil.d("logout success");

    /// todo get global context, back to welcome view
  }

  /// 保存登陆信息, 同步缓存
  void saveLoginInfo(LoginResultEntity user) {
    state.token.value = user.token!;
    state.userId.value = user.userId!;
    state.isLoggedIn.value = true;
    final tokenEntity = TokenEntity();
    tokenEntity.accessToken = state.token.value;
    authRepository.setLoginUserInfo(tokenEntity);
  }
}
