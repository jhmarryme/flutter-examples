import 'package:dio/dio.dart';
import 'package:test_in_action/common/http/http.dart';
import 'package:test_in_action/utils/log_utils.dart';

abstract class TokenInterceptor extends QueuedInterceptor {
  Dio? _tokenDio;

  @override
  Future<void> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    // 401代表token过期
    if (response.statusCode == ExceptionHandle.unauthorized) {
      LogUtil.d('-----------自动刷新Token------------');
      final String? accessToken = await getToken(); // 获取新的accessToken
      LogUtil.e('-----------NewToken: $accessToken ------------');
      if (accessToken != null) {
        // 重新请求失败接口
        final RequestOptions request = response.requestOptions;
        request.headers['Authorization'] = 'Bearer $accessToken';
        final Options options = Options(
          headers: request.headers,
          method: request.method,
        );
        try {
          LogUtil.e('----------- 重新请求接口 ------------');
          _tokenDio ??= Dio();
          _tokenDio!.options = DioUtils.instance.dio.options;

          /// 避免重复执行拦截器，使用tokenDio
          final Response<dynamic> response = await _tokenDio!.request<dynamic>(
            request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            cancelToken: request.cancelToken,
            options: options,
            onReceiveProgress: request.onReceiveProgress,
          );
          return handler.next(response);
        } on DioException catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onResponse(response, handler);
  }

  Future<String?> getToken() async {
    String refreshToken = getRefreshToken();
    if (refreshToken.isNotEmpty) {
      try {
        return doRefreshToken(refreshToken);
      } catch (e) {
        LogUtil.e('刷新Token失败！');
      }
    }
    return null;
  }

  String getRefreshToken();

  /// 通过refreshToken换取一个新的token
  String? doRefreshToken(String refreshToken);
}
