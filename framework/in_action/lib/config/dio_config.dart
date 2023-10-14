import 'package:dio/dio.dart';
import 'package:in_action/common/http/http.dart';

void initDio() {
  final List<Interceptor> interceptors = <Interceptor>[];

  /// 统一添加身份验证请求头
  // interceptors.add(AuthInterceptor());

  /// 刷新Token
  // interceptors.add(TokenInterceptor());

  /// 打印Log(生产模式去除)
  // if (!Constant.inProduction) {
  // interceptors.add(LoggingInterceptor());
  // }

  /// 适配数据(根据自己的数据结构，可自行选择添加)
  // interceptors.add(AdapterInterceptor());
  configDio(
    baseUrl: 'http://localhost:7777/',
    interceptors: interceptors,
  );
}
