import 'package:get/get.dart';

class AuthState {
  /// Mocks a login process
  final isLoggedIn = false.obs;

  /// Mocks a login process
  final token = "".obs;

  // todo 封装用户信息为对象
  final userId = 0.obs;

  AuthState();
}
