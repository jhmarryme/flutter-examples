import 'package:get/get.dart';
import 'package:test_in_action/app/dao/quiz/quizDao.dart';
import 'package:test_in_action/models/auth/token_entity.dart';
import 'package:test_in_action/services/storage/auth_repository.dart';
import 'package:test_in_action/utils/log_utils.dart';
import 'package:test_in_action/utils/other_utils.dart';
import 'package:test_in_action/utils/tips_util.dart';

import 'auth_state.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final state = AuthState();

  late final AuthRepository authRepository;

  AuthService() {
    authRepository = AuthRepository();
  }

  String get getAccessToken {
    if (state.token.value.isBlank == false) {
      return state.token.value;
    }
    final accessTokenInCache = authRepository.getToken()?.accessToken;
    LogUtil.d("accessTokenInCache: $accessTokenInCache");
    state.token.value = accessTokenInCache.nullSafe;
    return accessTokenInCache.nullSafe;
  }

  String get getRefreshToken {
    if (state.token.value.isBlank == false) {
      return state.token.value;
    }
    final refreshTokenInCache = authRepository.getToken()?.refreshToken;
    LogUtil.d("refreshTokenInCache: $refreshTokenInCache");
    return refreshTokenInCache.nullSafe;
  }

  bool get isLogin {
    return getAccessToken.isBlank == false;
  }

  Future<bool> login(String username, String password) async {
    final user = await QuizDao.login(username, password);
    LogUtil.d('login result: ${user.toJson()}');
    if (user.token == null) {
      TipsUtil.showToast("登陆失败");
      return false;
    }
    state.token.value = user.token!;
    state.userId.value = user.userId!;
    state.isLoggedIn.value = true;
    final tokenEntity = TokenEntity();
    tokenEntity.accessToken = state.token.value;
    authRepository.setLoginUserInfo(tokenEntity);
    return true;
  }

  void logout() {
    state.token.value = "";
    state.isLoggedIn.value = false;
    authRepository.logout();
  }

  /// todo 完善登陆过程
  void doLogin() {}
}
