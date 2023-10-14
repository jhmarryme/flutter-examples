import 'package:get/get.dart';
import 'package:in_action/app/dao/quiz/quizDao.dart';
import 'package:in_action/models/auth/token_entity.dart';
import 'package:in_action/services/storage/auth_repository.dart';
import 'package:in_action/utils/log_utils.dart';
import 'package:in_action/utils/tips_util.dart';

import 'auth_state.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final state = AuthState();

  late final AuthRepository authRepository;

  AuthService() {
    authRepository = AuthRepository();
  }

  bool get isLogin {
    if (state.token.value.isBlank == false) {
      return true;
    }
    final tokenEntity = authRepository.getToken();
    final tokenInCache = tokenEntity?.accessToken;
    LogUtil.d("tokenInCache: $tokenInCache");
    return (tokenInCache ?? '').isBlank == false;
  }

  Future<void> login(String username, String password) async {
    final user = await QuizDao.login(username, password);
    LogUtil.d('login result: ${user.toJson()}');
    if (user.token == null) {
      TipsUtil.showToast("登陆失败");
      return;
    }
    state.token.value = user.token!;
    state.userId.value = user.userId!;
    state.isLoggedIn.value = true;
    final tokenEntity = TokenEntity();
    tokenEntity.accessToken = state.token.value;
    authRepository.setLoginUserInfo(tokenEntity);
  }

  void logout() {
    state.token.value = "";
    state.isLoggedIn.value = false;
    authRepository.logout();
  }
}
