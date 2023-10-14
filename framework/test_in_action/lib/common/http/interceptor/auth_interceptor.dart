import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_in_action/utils/device_utils.dart';

abstract class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken = getAccessToken();
    if (accessToken.isBlank == false) {
      addTokenToRequest(accessToken, options);
    }
    if (!Device.isWeb) {
      // https://developer.github.com/v3/#user-agent-required
      options.headers['User-Agent'] = 'Mozilla/5.0';
    }
    super.onRequest(options, handler);
  }

  String getAccessToken();

  void addTokenToRequest(String accessToken, RequestOptions options) {
    options.headers['Authorization'] = 'token $accessToken';
  }
}
