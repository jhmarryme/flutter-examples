import 'package:get/get.dart';
import 'package:in_action/app/dao/quiz/quizDao.dart';
import 'package:in_action/utils/log_utils.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Mocks a login process
  final isLoggedIn = false.obs;

  bool get isLoggedInValue => isLoggedIn.value;

  /// Mocks a login process
  final token = "".obs;

  String get tokenValue => token.value;
  final userId = 0.obs;

  num get userIdValue => userId.value;

  Future<void> login(String username, String password) async {
    final user = await QuizDao.login(username, password);
    LogUtil.d('login result: ${user.toJson()}');
    if (user.token == null) {
      Get.snackbar("title", "密码错误");
      return;
    }
    token.value = user.token!;
    userId.value = user.userId!;
    isLoggedIn.value = true;
  }

  void logout() {
    token.value = "";
    isLoggedIn.value = false;
  }
}
